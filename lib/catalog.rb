require 'pathname'
require 'fileutils'
require 'yaml'

module PageBarfer
  class Catalog
    attr_reader :products, :top_level_categories, :layouts

    def initialize(args={})
      @products     = args[:products] #should = results of json product import
      @layouts      = args[:layouts] #should = results of layout import
    end

    def create(creators)
      creators.each { |creator| creator.create_catalog(self) }
    end

    def read_config_file
      # dependency: Catalog expects that a class named YAML exists.
      # It also expects a YAML instance to respond to load_file
      # It also knows that it requires an argument
      @products_file = ConfigReader.load_file('bacon-store/_config.yml')
    end

    # collect the products expects callers to know the order of its args
    def read_product_file(products_file, data_store_type)
      @products = data_store_type.import(self)
    end
  end

  module ConfigReader
    def self.load_file
      YAML.load_file('bacon-store/_config.yml')
    end
  end
end