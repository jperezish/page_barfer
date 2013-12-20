require_relative '../lib/catalog_addition'
require_relative 'spec_helper'

module PageBarfer

  describe CatalogAddition do
    before do
      @configuration  = ConfigurationDouble.new
      @products       = ProductsDouble.new
    end

    describe "#initialize" do
      before do
        @page_addition  = PageAdditionDouble.new
      end
      it "requires a configuration" do
        proc do
          catalog = CatalogAddition.new(page_addition:  @page_addition,
                                        products:       @products)
        end.must_raise KeyError
      end

      it "requires products" do
        proc do
          catalog = CatalogAddition.new(page_addition:  @page_addition,
                                        configuration:  @configuration)
        end.must_raise KeyError
      end

      it "requires pages" do
        proc do
          catalog = CatalogAddition.new(configuration:  @configuration,
                                        products:       @products)
        end.must_raise KeyError
      end
    end

    describe "#create_new_catalog" do
      before do
        @page_addition = MiniTest::Mock.new
        @catalog = CatalogAddition.new(page_addition:  @page_addition,
                                        configuration:  @configuration,
                                        products:       @products)
        @args = { layouts:       @configuration.layouts,
                 products:       @products.get_the_product_list(nil),
                 catalog_name:   @configuration.catalog_name }
      end

      it "sends a message to create the content for a new catalog" do
        @page_addition.expect :create_pages, nil, [@args]
        @catalog.create_new_catalog
        assert @page_addition.verify
      end
    end
  end

  #Test Doubles
  class ConfigurationDouble
    def layouts
      ["layout.html"]
    end

    def catalog_name
      "sample"
    end

    def catalog_file_name
    end
  end

  class ProductsDouble
    def get_the_product_list(args)
      {}
    end
  end

  class PageAdditionDouble
    def create_pages(args)
    end
  end
end
