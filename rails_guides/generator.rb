#coding: utf-8
require 'set'
require 'fileutils'

require 'active_support/core_ext/string/output_safety'
require 'active_support/core_ext/object/blank'
require 'action_controller'
require 'action_view'

require 'rails_guides/helpers'
require 'rails_guides/body_converter'
require 'rails_guides/check_anchors'

module RailsGuides
  class Generator
    include CheckAnchors
    attr_reader :guides_dir, :source_dir, :output_dir, :edge, :all

    GUIDES_RE = /\.(?:textile|erb|markdown|md)$/

    def initialize(output=nil)
      set_flags_from_environment

      if kindle?
        check_for_kindlegen
        register_kindle_mime_types
      end

      initialize_dirs(output)
      create_output_dir_if_needed
    end

    def set_flags_from_environment
      @edge     = ENV['EDGE']     == '1'
      @all      = ENV['ALL']      == '1'
      @kindle   = ENV['KINDLE']   == '1'
      @version  = ENV['RAILS_VERSION'] || RailsGuides::Version
      @lang     = ENV['GUIDES_LANGUAGE']
    end

    def register_kindle_mime_types
      Mime::Type.register_alias("application/xml", :opf, %w(opf))
      Mime::Type.register_alias("application/xml", :ncx, %w(ncx))
    end

    def generate
      generate_guides
      copy_assets
      generate_mobi if kindle?
    end

    private

    def kindle?
      @kindle
    end

    def check_for_kindlegen
      if `which kindlegen`.blank?
        raise "Can't create a kindle version without `kindlegen`."
      end
    end

    def generate_mobi
      opf = "#{output_dir}/rails_guides.opf"
      out = "#{output_dir}/kindlegen.out"

      system "kindlegen #{opf} -o #{mobi} > #{out} 2>&1"
      puts "Guides compiled as Kindle book to #{mobi}"
      puts "(kindlegen log at #{out})."
    end

    def mobi
      "ruby_on_rails_guides_#@version%s.mobi" % (@lang.present? ? ".#@lang" : '')
    end

    def initialize_dirs(output)
      @guides_dir = File.join(File.dirname(__FILE__), '..')
      @source_dir = "#@guides_dir/source/#@lang"
      @output_dir = if output
        output
      elsif kindle?
        "#@guides_dir/output/kindle/#@lang"
      else
        "#@guides_dir/output/#@lang"
      end.sub(%r</$>, '')
    end

    def create_output_dir_if_needed
      FileUtils.mkdir_p(output_dir)
    end

    def generate_guides
      guides_to_generate.each do |guide|
        output_file = output_file_for(guide)
        generate_guide(guide, output_file)  if generate?(guide, output_file)
      end
    end
    def guides_to_generate
      guides = Dir.entries(source_dir).grep(GUIDES_RE)

      if kindle?
        Dir.entries("#{source_dir}/kindle").grep(GUIDES_RE).map do |entry|
          guides << "kindle/#{entry}"
        end
      end

      ENV.key?('ONLY') ? select_only(guides) : guides
    end

    def select_only(guides)
      prefixes = ENV['ONLY'].split(",").map(&:strip)
      guides.select do |guide|
        prefixes.any? { |p| guide.start_with?(p) || guide.start_with?("kindle") }
      end
    end

    def copy_assets
      FileUtils.cp_r(Dir.glob("#{guides_dir}/assets/*"), output_dir)
    end

    def output_file_for(guide)
      if guide =~/\.textile$/
        guide.sub(/\.textile$/, '.html')
      elsif guide=~/\.(markdown|md)$/
        guide.sub(/\.(markdown|md)$/,'.html')
      else
        guide.sub(/\.erb$/, '')
      end
    end

    def output_path_for(output_file)
      File.join(output_dir, File.basename(output_file))
    end

    def generate?(source_file, output_file)
      fin  = File.join(source_dir, source_file)
      fout = output_path_for(output_file)
      all || !File.exist?(fout) || File.mtime(fout) < File.mtime(fin)
    end

    def generate_guide(guide, output_file)
      output_path = output_path_for(output_file)
      puts "Generating #{guide} as #{output_file}"
      layout = kindle? ? 'kindle/layout' : 'layout'

      File.open(output_path, 'w') do |f|
        view = ActionView::Base.new(source_dir, :edge => @edge, :version => @version, :mobi => "kindle/#{mobi}")
        view.extend(Helpers)

        if guide =~ /\.(\w+)\.erb$/
            result = view.render(:layout => layout, :formats => [$1], :file => $`)
        else
          body = File.read(File.join(source_dir,guide))
          guide =~ /\w+\.(markdown|textile|md)$/
          result = process_body(body,view,layout,$1)
          warn_about_broken_links(result) 
        end

        f.write(result)
      end
    end
    
    def process_body(body,view,layout,markup)
      body = BodyConverter.new(body,view,markup).convert_body 
      result = view.render(:layout => layout, :text => body)
    end
   
    
  end
end
