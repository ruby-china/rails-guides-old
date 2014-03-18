#coding: utf-8
module RailsGuides
  module Helpers
    def guide(name, url, options = {}, &block)
      link = content_tag(:a, :href => url) { name }
      result = content_tag(:dt, link)
      result <<
      if options[:work_in_progress]
         content_tag(:dd, "施工中！贡献者: #{generate_contributors_link(options[:contributor])}".html_safe, :class => 'work-in-progress')
      elsif !options[:contributor]
         content_tag(:dd, :class => 'work-in-progress' ) do
          "这篇还没有人翻译，我要<a href='https://github.com/ruby-china/rails-guides'>翻译本文</a>".html_safe
        end
      else
         content_tag(:dd, :class => 'contributor' ) do
             "贡献者：#{generate_contributors_link(options[:contributor])}".html_safe
        end
      end
      result << content_tag(:dd, capture(&block))
      result
    end

    def documents_by_section
      @documents_by_section ||= YAML.load_file(File.expand_path("../../source/documents_#{ENV['GUIDES_LANGUAGE']}.yaml", __FILE__))
    end

    def documents_flat
      documents_by_section.map {|section| section['documents']}.flatten
    end

    def finished_documents(documents)
      documents.reject { |document| document['work_in_progress'] }
    end

    def docs_for_menu(position)
      position == 'L' ? documents_by_section.to(3) : documents_by_section.from(4)
    end

    def author(name, nick, image = 'credits_pic_blank.gif', &block)
      image = "images/#{image}"

      result = content_tag(:img, nil, :src => image, :class => 'left pic', :alt => name, :width => 91, :height => 91)
      result << content_tag(:h3, name)
      result << content_tag(:p, capture(&block))
      content_tag(:div, result, :class => 'clearfix', :id => nick)
    end

    def code(&block)
      c = capture(&block)
      content_tag(:code, c)
    end

  private
    def generate_contributors_link(contributors_string = '')
      result = []
      contributors = contributors_string.split(/\,\s/)
      contributors.each do |name|
        result << content_tag('a', name, :href => "https://github.com/#{name}")
      end

      return result.join(', ')
    end
  end
end
