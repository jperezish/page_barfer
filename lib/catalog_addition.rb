require_relative '../lib/page_addition'
require 'fileutils'
require 'yaml'
require 'json'

module PageBarfer
  class CatalogAddition
    attr_reader :layouts, :products

    def initialize(args={})
      @config_file            = "_page_barfer.yml"
      @page_addition  = args[:page_addition]
    end

    def prepare_new_catalog
      FileUtils.touch @config_file

      file = File.new(@config_file, "w")
      file.puts "# Page Barfer config"
      file.puts "layout_for_product_details: sample_product_details.html"
      file.puts "layout_for_categories: sample_category.html"
      file.puts "catalog_file: products.json"
      file.close
    end

    def get_catalog_settings
      read_page_barfer_config_file
      read_catalog_file
    end

    def create_new_catalog
      args = { layouts: layouts,
               products: products }
      @page_addition.create_pages(args)
    end

  private

    def read_page_barfer_config_file
      layout_prefix = "layout_for"
      config = load_page_barfer_config_file
      @catalog_file_name = config["catalog_file"]
      @layouts = config.select { |k, v| k.include? layout_prefix }
    end

    def read_catalog_file
      @products = JSON.parse(IO.read(@catalog_file_name))
    end

    def load_page_barfer_config_file
      YAML.load_file(@config_file)
    end
  end
end