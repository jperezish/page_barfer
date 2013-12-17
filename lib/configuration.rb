require_relative '../lib/page_addition'
require 'fileutils'
require 'yaml'
require 'json'

module PageBarfer
  class Configuration
    attr_reader :layouts, :catalog_name, :catalog_file_name

    def initialize
      @config_file_name = "_page_barfer.yml"
      create_config_file
      read_config_file
    end

    def create_config_file
      if !(File.file? @config_file_name)
        FileUtils.touch @config_file_name
        file = File.new(@config_file_name, "w")
        file.puts "# Page Barfer config"
        file.puts "layout_for_product_details: sample_product_details.html"
        file.puts "layout_for_categories: sample_category.html"
        file.puts "catalog_file: products.json"
        file.puts "catalog_name: sample"
        file.close
      end
    end

    def read_config_file
      layout_prefix = "layout_for"
      config = load_page_barfer_config_file
      @catalog_file_name = config["catalog_file"]
      @catalog_name = config["catalog_name"]
      @layouts = config.select { |k, v| k.include? layout_prefix }
    end

    def load_page_barfer_config_file
      YAML.load_file(@config_file_name)
    end
  end
end