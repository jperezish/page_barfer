require_relative '../lib/products'
require_relative 'spec_helper'

module PageBarfer

  describe Products do
    before do
      @catalog_file_name = "catalog.json"
      @json              = Minitest::Mock.new
      @io                = IODouble.new
      @products          = Products.new
    end

    it "sends a message to get the product list" do
      args = { :parser            => @json,
               :file_reader       => @io,
               :catalog_file_name => @catalog_file_name}
      @json.expect :parse, true, [@io.read(@catalog_file_name)]
      @products.get_the_product_list(args)
      assert  @json.verify
    end
  end

  #Test Double
  class IODouble
    def read(file_name)
      "{}"
    end
  end
end