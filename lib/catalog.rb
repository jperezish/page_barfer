require 'json'

module PageBarfer

  class Catalog
    attr_reader :products, :file_path

    def get_products(file_path, data_source)
      @file_path = file_path
      @products = data_source.import(self)
    end
  end

end