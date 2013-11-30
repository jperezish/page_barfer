require_relative '../lib/category'
require_relative 'spec_helper'

module PageBarfer

  describe Category do
    describe "#make_the_directories" do
      it "creates all the product category pages"
    end
  end
end

# For each product:
#   create the directories if they don't exist
#   create a data file for all of the products
#   create the index file with all of the products in the category