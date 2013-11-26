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
  end

# Test Doubles
  class ImportsJsonDouble
    def import(page_data)
      [{"product_name" => "Bacon"}]
    end
  end
end

