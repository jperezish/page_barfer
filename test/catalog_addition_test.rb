require_relative '../lib/catalog_addition'
require_relative 'spec_helper'

module PageBarfer

  describe CatalogAddition do
    before do
      @configuration  = ConfigurationDouble.new
      @page_addition  = PageAdditionDouble.new
      @products       = ProductsDouble.new
    end

    describe "#initialize" do
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
        @catalog = CatalogAddition.new(page_addition:  @page_addition,
                                        configuration:  @configuration,
                                        products:       @products)
      end
      it "sends a message to create a new catalog" do
        @catalog.must_respond_to :create_new_catalog
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
  end

  class ProductsDouble
    def get_the_product_list
      {}
    end
  end

  class PageAdditionDouble
    def create_pages(args)
    end
  end
end
