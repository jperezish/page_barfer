require_relative '../lib/catalog'
require_relative 'spec_helper'

module PageBarfer

  describe Catalog do
    before do
      @file_path = "products.json"
      @my_page_data = Catalog.new
      @imports_json = MiniTest::Mock.new
    end

    describe "#get_catalog_products" do
      it "sends a message to import from a json file" do
        @imports_json.expect(:import, true, [Catalog])
        @my_page_data.get_catalog_products(@file_path, @imports_json)

        @imports_json.verify
      end

      it "provides access to variables" do
        imports_json = ImportsJsonDouble.new
        @my_page_data.get_catalog_products(@file_path, imports_json)

        @my_page_data.catalog_products.first["product_name"].must_equal "Bacon"
      end
    end
  end

# Test Doubles
  class ImportsJsonDouble
    def import(page_data)
      [{"product_name" => "Bacon"}]
    end
  end
end

