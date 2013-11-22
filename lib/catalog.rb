require 'pathname'
require 'fileutils'
require 'yaml'

module PageBarfer
  class Catalog
    attr_reader :products

    def self.create
      @data_store_type  = ImportsJson.new

      collect_the_products(@products_file, @data_store_type)
    end

    def read_config_file
      @products_file = YAML.load_file('_config.yml')
    end

    def collect_the_products(products_file, data_store_type)
      @products = data_store_type.import(self)
    end

    def generate_pages
      index_path = Pathname.new("products/bacon-supplies/savory/bubba/index.html")
      index_directory = index_path.dirname

      index_directory.descend do |dir|
        FileUtils.mkdir dir unless File.exist?(dir)
      end
      FileUtils.touch index_path.to_s
    end
  end
end