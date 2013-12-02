require 'fileutils'

module PageBarfer
  class Product
    attr_reader :directories

    def create_catalog(catalog)
      @products    = catalog.products
      @layouts     = catalog.layouts

      @products.each do |product|
        get_products_categories(product)
        create_directories_from_categories
        create_product_details_page(product)
      end
    end

  private

    def get_products_categories(product)
      @directories      = ""
      hierarchy_name    = ""
      product_hierarchy = product["hierarchies"].first["products"]

      product_hierarchy.each do |category|
        @directories << "#{format_category_for_directory(category)}/"
      end
    end

    def create_directories_from_categories
      FileUtils.mkdir_p @directories
    end

    def create_product_details_page(product)
      product_detail_page = "#{@directories}/index.html"
      FileUtils.touch product_detail_page
      yaml_front_matter = ""

      file = File.new(product_detail_page, "w")
      file.puts("---")

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