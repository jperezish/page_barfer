require_relative '../lib/catalog_addition'
require_relative 'spec_helper'

module PageBarfer

  describe CatalogAddition do
    before do
      @config_file    = "_page_barfer.yml"
      @products_file  = "products.json"
      @page_addition  = MiniTest::Mock.new
      @catalog        = CatalogAddition.new(page_addition: @page_addition)
      @catalog.prepare_new_catalog
    end

    after do
      @catalog = ""
    end

    describe "#prepare_new_catalog" do

      it "creates the page barfer config file" do
        File.file?(@config_file).must_equal true
        FileUtils.rm_rf @config_file
      end

      it "does not overwrite the page barfer config file if it already exists" do
        file = File.new(@config_file, "a")
        file.puts "layout_for_test: should not delete"
        file.close

        @catalog.prepare_new_catalog
        @catalog.get_catalog_settings
        @catalog.layouts["layout_for_test"].must_equal "should not delete"
        FileUtils.rm_rf @config_file
      end
    end

    describe "#get_catalog_settings" do
      before do
        @catalog.get_catalog_settings
      end

      it "gets a list of products in the catalog" do
        @catalog.products[1]["sku"].must_equal "1332328976"
      end

      it "gets a list of page layouts" do
        page_layout_name = "layout_for_product_details"
        layout_file_name = "sample_product_details.html"

        @catalog.layouts[page_layout_name].must_equal layout_file_name
      end
    end

    describe "#create_new_catalog" do
      it "sends a message to create a new catalog" do
        args = { layouts:      nil,
                 products:     nil,
                 catalog_name: nil }
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