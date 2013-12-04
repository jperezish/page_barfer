require 'fileutils'
require 'yaml'
require 'json'

module PageBarfer
  class Catalog
    attr_reader :products, :top_level_categories, :layouts

    def initialize
      read_config_file
      read_catalog_file
    end

    def create(creators)
      creators.each { |creator| creator.create_catalog(self) }
    end

private

    def read_config_file
      layout_prefix = "layout_for"
      config = ConfigReader.load_file
      @catalog_file_name = config["catalog_file"]
      @layouts = config.select { |k, v| k.include? layout_prefix }
    end

    def read_catalog_file
      @products = JSON.parse(IO.read(@catalog_file_name))
    end
  end

  module ConfigReader
    def self.load_file
      YAML.load_file("_page_barfer.yml")
    end
  end
end