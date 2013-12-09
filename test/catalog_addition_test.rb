require_relative '../lib/catalog_addition'
require_relative 'spec_helper'

module PageBarfer

  describe CatalogAddition do
    before do
      @config_file    = "_page_barfer.yml"
      @products_file  = "products.json"
      @page_addition  = MiniTest::Mock.new
      @catalog        = CatalogAddition.new(page_addition: @page_addition)
    end

    describe "#prepare_new_catalog" do

      it "creates the page barfer config file" do
        @catalog.prepare_new_catalog

        assert File.exist?(@config_file),
          "'#{@config_file}' not found."
      end
    end

    describe "#get_catalog_settings" do
      before do
        @catalog.get_catalog_settings
      end

      it "creates a list of products in the catalog" do
        @catalog.products[1]["sku"].must_equal "1332328976"
      end

      it "creates a list of page layouts" do
        page_layout_name = "layout_for_product_details"
        layout_file_name = "sample_product_details.html"

        @catalog.layouts[page_layout_name].must_equal layout_file_name
      end
    end

    describe "#create_new_catalog" do
      it "sends a message to create a new catalog" do
        args = { layouts: nil,
               products: nil }
        @page_addition.expect :create_pages, true, [args]
        @catalog.create_new_catalog
        @page_addition.verify
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