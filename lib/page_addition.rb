require 'fileutils'

module PageBarfer
  class PageAddition

    def create_pages(args={})
      @products     = args[:products]
      @layouts      = args[:layouts]
      @catalog_name = args[:catalog_name]

      @products.each do |product|
        get_product_categories(product)
        create_directories_from_categories
        create_product_details_page(product)
      end
    end

  private

    def get_product_categories(product)
      product_hierarchy = product["hierarchy"]
      @directory_path   = "#{@catalog_name}/"
      product_hierarchy.each do |category|
        @directory_path << "#{format_category_for_directory(category)}/"
      end
    end

    def create_directories_from_categories
      FileUtils.mkdir_p @directory_path
    end

    def create_product_details_page(product)
      product_detail_page = "#{@directory_path}/index.html"
      FileUtils.touch product_detail_page
      yaml_front_matter = ""

      file = File.new(product_detail_page, "w")
      file.puts("---")
      file.puts("layout: #{@layouts['layout_for_product_details']}")
      product.each do |key, value|
        file.puts "#{key}: #{value}"
      end

      file.puts("---")
      file.close
    end

    def format_category_for_directory(category)
      category.downcase.gsub(/[^a-z\s]/, '').gsub(' ', '-')
    end
  end
end