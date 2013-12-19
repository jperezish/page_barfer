require_relative '../lib/category_addition'
require_relative 'spec_helper'

module PageBarfer

  describe CategoryAddition do
    before do
      @args = {:products =>   [
                  { "sku" => "1234",
                    "description" => "The best savory bacon you're ever gonna taste!",
                    "hierarchy" => ["Bacon Supplies", "Savory!", "Bubba's"]
                  },
                  { "sku" => "1255",
                    "description" => "Bacon + chocolate + 100% pure awesome!",
                    "hierarchy" => ["Bacon Supplies", "Sweet!",
                                    "Granny Jean's Bacon Treats"]
                  }
                ],
                :layouts => {
                    "layout_for_product_details" => "product_details.html" },
                :catalog_name => "sample"
        }
      @category_addition = CategoryAddition.new
      @category_addition.create_pages(@args)
    end

    describe "#create_pages" do
      it "creates all the category directories" do
        File.exist?("sample/bacon-supplies/savory").must_equal true
      end

      it "creates all the product category pages" do
        File.exist?("sample/bacon-supplies/savory/index.html").must_equal true
      end

      it "adds the category layout to the category index page" do
        lines = []
        file = File.new("sample/bacon-supplies/savory/index.html", "r")
        file.each { |line| lines << line }

        lines[1].delete("\n").must_equal "layout: product_details.html"
      end

      it "adds the category's products and attributes to the category index page" do
        lines = []
        file = File.new("sample/bacon-supplies/savory/index.html", "r")
        file.each { |line| lines << line }

        lines[2].delete("\n").must_equal "sku: 1234"
      end
    end

    after do
      FileUtils.rm_rf 'sample'
    end
  end
end
