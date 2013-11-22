require 'pathname'
require 'fileutils'

module PageBarfer
  class CatalogSettings
    def self.configure(jekyll_site_name)
      @jekyll_site_name = jekyll_site_name
      @config_path = Pathname.new("#{@jekyll_site_name}/_plugins/page_barfer/page_barfer_config.yml")
      @page_barfer_directory = @config_path.dirname

      @page_barfer_directory.descend do |dir|
        FileUtils.mkdir dir unless File.exist?(dir)
      end

      FileUtils.touch @config_path.to_s

      f = File.new("#{@jekyll_site_name}/_config.yml", "w")
      f.puts "# Page Barfer config"
      f.puts "product_details_layout: #sample_product_details.html"
      f.puts "category_layout: #sample_category.html"
      f.puts "product_file: #sample_products.json"
      f.close

    end
  end
end