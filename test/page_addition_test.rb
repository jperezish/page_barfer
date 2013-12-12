require_relative '../lib/page_addition'
require_relative 'spec_helper'

module PageBarfer

  describe PageAddition do
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
      @page_addition = PageAddition.new
      @page_addition.create_pages(@args)
    end

    describe "#create_pages" do
      it "creates all the directories" do
        File.exist?("sample/bacon-supplies/savory/bubbas").must_equal true
      end

      it "creates the product detail pages" do
        File.exist?("sample/bacon-supplies/savory/bubbas/index.html").must_equal true
      end

      it "adds product attributes to the product details page" do
        lines = []
        file = File.new("sample/bacon-supplies/savory/bubbas/index.html", "r")
        file.each { |line| lines << line }

        lines[2].delete("\n").must_equal "sku: 1234"
      end

      it "adds the product layout to the product details page" do
        lines = []
        file = File.new("sample/bacon-supplies/savory/bubbas/index.html", "r")
        file.each { |line| lines << line }

        lines[1].delete("\n").must_equal "layout: product_details.html"
      end

      after do
        FileUtils.rm_rf 'sample'
      end
    end
  end
end
