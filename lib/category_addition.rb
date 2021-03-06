require 'fileutils'

module PageBarfer
  class CategoryAddition

    def create_pages(args={})
      @products     = args.fetch(:products)
      @layouts      = args.fetch(:layouts)
      @catalog_name = args.fetch(:catalog_name)

      @products.each do |product|
        get_product_categories(product)
        create_directories_from_categories
        create_category_index_page(product)
      end
    end

    private

    def get_product_categories(product)
      product_hierarchy = product["hierarchy"]
      product_hierarchy.pop
      @directory_path   = "#{@catalog_name}/"
      product_hierarchy.each do |category|
        @directory_path << "#{format_category_for_directory(category)}/"
      end
    end

    def create_directories_from_categories
      FileUtils.mkdir_p @directory_path
    end

    def create_category_index_page(product)
      category_index_page = "#{@directory_path}/index.html"
      FileUtils.touch category_index_page
      yaml_front_matter = ""

      file = File.new(category_index_page, "w")
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