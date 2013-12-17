require_relative '../lib/configuration'
require_relative 'spec_helper'

module PageBarfer

  describe Configuration do
    before do
      @config_file_name = "_page_barfer.yml"
    end

    describe "initialize the config file" do
      it "creates the page barfer config file" do
        Configuration.new

        File.file?(@config_file_name).must_equal true
        FileUtils.rm_rf @config_file_name
      end

      it "does not overwrite the page barfer config file if it already exists" do
        file = File.new(@config_file_name, "w")
        file.puts "layout_for_test: should not delete"
        file.close
        config_file = Configuration.new
        config = YAML.load_file(@config_file_name)

        config["layout_for_test"].must_equal "should not delete"
        FileUtils.rm_rf @config_file_name
      end

      describe "read the config file" do
        before do
          @config_file = Configuration.new
        end

        after do
          FileUtils.rm_rf @config_file_name
        end
        it "gets a list of page layouts" do
          page_layout_name = "layout_for_product_details"
          layout_file_name = "sample_product_details.html"

          @config_file.layouts[page_layout_name].must_equal layout_file_name
        end

        it "gets the name of the catalog" do
          @config_file.catalog_name.must_equal "sample"
        end

        it "gets the catalog file name" do
          @config_file.catalog_file_name.must_equal "products.json"
        end
      end
    end
  end
end