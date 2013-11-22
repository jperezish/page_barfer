require 'pathname'
require 'fileutils'

module PageBarfer
  class Catalog
    attr_reader :products

    def self.create_from(products_file)
      @products_file = products_file

      index_path = Pathname.new("products/bacon-supplies/savory/bubba/index.html")
      index_directory = index_path.dirname

      index_directory.descend do |dir|
        FileUtils.mkdir dir unless File.exist?(dir)
      end
      FileUtils.touch index_path.to_s

      puts "Successfully imported products.json."
    end

    def get_products_from(products_file, data_store_type)
      @products = data_store_type.import(self)
    end
  end
end