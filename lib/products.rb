require 'json'

module PageBarfer
  class Products

    def get_the_product_list(args)
      @catalog_file_name  = args[:catalog_file_name]
      @parser             = args[:parser]
      @file_reader        = args[:file_reader]
      @parser.parse(@file_reader.read(@catalog_file_name))
    end
  end
end