require 'json'

module PageBarfer
  class Products
    def get_the_product_list(catalog_file_name)
      JSON.parse(IO.read(catalog_file_name))
    end
  end
end