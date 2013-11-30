require_relative '../lib/catalog'
require_relative 'spec_helper'

module PageBarfer

  describe Catalog do
    before do
      @products_file   = "products.json"
      @creator         = MiniTest::Mock.new
      @catalog         = Catalog.new
    end

    describe "#create" do
      it "requests pages and directories be created" do
        @creator.expect(:create_catalog, nil, [@catalog])
        @catalog.create([@creator])
        @creator.verify
      end
    end

    describe "#products" do
      it "provides a list of products in the catalog" do
        @catalog.products[1]["sku"].must_equal "1332328976"
      end
    end

    describe "#layouts" do
      it "provides a list of the layouts" do
        @catalog.layouts["layout_for_product_details"].must_equal "sample_product_details.html"
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

