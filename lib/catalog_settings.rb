require 'fileutils'

module PageBarfer
  class CatalogSettings
    def self.configure
      @config_file = "_page_barfer.yml"

      FileUtils.touch @config_file

      f = File.new(@config_file, "w")
      f.puts "# Page Barfer config"
      f.puts "product_details_layout: #sample_product_details.html"
      f.puts "category_layout: #sample_category.html"
      f.puts "product_file: #sample_products.json"
      f.close

    end
  end
end