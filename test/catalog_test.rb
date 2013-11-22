require_relative '../lib/catalog'
require_relative 'spec_helper'

module PageBarfer

  describe Catalog do
    before do
      @products_file = "products.json"
      @my_page_data = Catalog.new
      @imports_json = MiniTest::Mock.new
    end

    describe "#self.create_from" do
      it "gets the names of the layout files"
      it "gets the name of the products file"
      it "gets the product attributes" do
        imports_json = ImportsJsonDouble.new
        @my_page_data.collect_the_products(@products_file, imports_json)

        @my_page_data.products.first["product_name"].must_equal "Bacon"
      end
    end

    describe "#" do
      it "gets the names of the layout files"
      it "gets the name of the products file"
    end

    describe "#collect_the_products" do
      it "sends a message to import from a json file" do
        @imports_json.expect(:import, true, [Catalog])
        @my_page_data.collect_the_products(@products_file, @imports_json)

        @imports_json.verify
      end
    end

    describe "#generate_pages" do

      it "creates all the directories"
      it "creates all the product detail pages"
      it "creates all the product category pages"
    end

  end

# Test Doubles
  class ImportsJsonDouble
    def import(page_data)
      [{"product_name" => "Bacon"}]
    end
  end
end

