require 'json'

module PageBarfer

  class Catalog
    attr_reader :catalog_products, :file_path

    def get_catalog_products(file_path, data_source)
      @file_path = file_path
      @catalog_products = data_source.import(self)
    end
  end

end