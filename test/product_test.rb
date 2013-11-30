require_relative '../lib/product'
require_relative 'spec_helper'

module PageBarfer

  describe Product do
    before do
      @catalog_double = CatalogDouble.new
      @product = Product.new
      @product.create_catalog(@catalog_double)
    end

    describe "#create_catalog" do
      it "creates all the directories" do

        File.exist?("bacon-supplies/savory/bubbas").must_equal true
      end

      it "creates all the product detail pages" do

        File.exist?("bacon-supplies/savory/bubbas/index.html").must_equal true
      end
    end
  end

  class TestProduct < MiniTest::Unit::TestCase
    def setup
      @catalog_double = CatalogDouble.new
      @product = Product.new
      @product.create_catalog(@catalog_double)
    end

    def test_create_directories
      assert_equal "bacon-supplies/savory/bubbas/", @product.directories
    end
  end
end





class CatalogDouble
  def products
    [
      { "sku" => "1234",
        "hierarchies" => [
          {
            "products" => ["Bacon Supplies", "Savory!", "Bubba's"]
          }
        ]
      }
    ]
  end

  def layouts
    { "product_details" => "product_details.html" }
  end
end

# For each product:
#   create the directories if they don't exist
#   create the index file with all of the attributes