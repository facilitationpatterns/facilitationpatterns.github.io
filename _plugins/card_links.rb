module Jekyll
  class CardLinksConverter < Converter
    def matches(ext)
      ext =~ /^\.textile$/i
    end

    def output_ext(ext)
      ".html"
    end

    def read_title(file)
      if File.read(file) =~ /title: (.+)\n/
        $1
      else
        File.basename(file)
      end
    end

    def lookup_page(name)
      dir = File.expand_path(File.dirname(__FILE__) + "/..")
      file = Dir["#{dir}/#{name}.*"].first
      return ["/#{name}", read_title(file)] if file

      file = Dir["#{dir}/_cards/#{name}.*"].first
      return ["/cards/#{name}.html", read_title(file)] if file

      [nil, nil]
    end

    def convert(content)
      content.gsub(/\[([^\]]+)\]/) do 
        url, title = lookup_page($1)
        if url
          "<a href='#{url}'>[#{title}]</a>"
        else
          "[#{$1}]"
        end
      end
    end
  end
end

module Jekyll
  module Filters
    def mytextilize(input)
      site = @context.registers[:site]
      converter = if site.respond_to?(:find_converter_instance)
        site.find_converter_instance(Jekyll::CardLinksConverter)
      else
        site.getConverterImpl(Jekyll::CardLinksConverter)
      end
      textilize(converter.convert(input))
    end
  end
end
