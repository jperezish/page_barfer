require 'fileutils'

module PageBarfer
  class CatalogSettings
    def self.configure
      @config_file = "_page_barfer.yml"
      FileUtils.touch @config_file

      file = File.new(@config_file, "w")
      file.puts "# Page Barfer config"
      file.puts "layout_for_product_details: sample_product_details.html"
      file.puts "layout_for_categories: sample_category.html"
      file.puts "catalog_file: products.json"
      file.close
    end
  end
end