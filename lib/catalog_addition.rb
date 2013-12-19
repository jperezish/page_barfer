require_relative '../lib/page_addition'

require 'fileutils'
require 'yaml'
require 'json'

module PageBarfer
  class CatalogAddition

    def initialize(args={})
      @configuration      = args.fetch(:configuration)
      @page_addition      = args.fetch(:page_addition)
      @products           = args.fetch(:products)
    end

    def create_new_catalog
      layouts           = @configuration.layouts
      catalog_name      = @configuration.catalog_name
      catalog_file_name = @configuration.catalog_file_name
      args              = { :parser            => JSON,
                            :file_reader       => IO,
                            :catalog_file_name => catalog_file_name}
      products          = @products.get_the_product_list(args)

      args = { layouts:       layouts,
               products:      products,
               catalog_name:  catalog_name }
      @page_addition.create_pages(args)
    end
  end
end