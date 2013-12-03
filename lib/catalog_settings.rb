require 'fileutils'

module PageBarfer
  class CatalogSettings
    def self.configure
      @config_file = "_page_barfer.yml"
      FileUtils.touch @config_file

      file = File.new(@config_file, "w")
      file.puts "# Page Barfer config"
      file.puts "product_details_layout: #sample_product_details.html"
      file.puts "category_layout: #sample_category.html"
      file.puts "product_file: #sample_products.json"
      file.close
    end
  end
end