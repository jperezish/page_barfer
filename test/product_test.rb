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

      it "creates the product detail pages" do
        File.exist?("bacon-supplies/savory/bubbas/index.html").must_equal true
      end

      it "adds product attributes to the product details page" do
        lines = []
        file = File.new("bacon-supplies/savory/bubbas/index.html", "r")
        file.each { |line| lines << line }

        lines[1].delete("\n").must_equal "sku: 1234"
      end
    end

    # after do
    #   FileUtils.rm_rf 'bacon-supplies'
    # end
  end

  class TestProduct < MiniTest::Unit::TestCase
    def setup
      @catalog_double = CatalogDouble.new
      @product = Product.new
      @product.create_catalog(@catalog_double)
    end

    def test_create_directories
      test_path = "bacon-supplies/sweet/granny-jeans-bacon-treats/"
      assert_equal test_path, @product.directory_path
    end

    # def teardown
    #   FileUtils.rm_rf 'bacon-supplies'
    # end
  end
end





class CatalogDouble
  def products
    [
      { "sku" => "1234",
        "description" => "The best savory bacon you're ever gonna taste!",
        "hierarchy" => ["Bacon Supplies", "Savory!", "Bubba's"]
      },
      { "sku" => "1255",
        "description" => "Bacon + chocolate + 100% pure awesome!",
        "hierarchy" => ["Bacon Supplies", "Sweet!", "Granny Jean's Bacon Treats"]
      }
    ]
  end

  def layouts
    { "product_details" => "product_details.html" }
  end
end
