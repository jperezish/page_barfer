require_relative '../lib/category'
require_relative '../lib/product'
require_relative 'spec_helper'

module PageBarfer
  module CatalogInterfaceTest
    def test_implements_the_creator_interface
      assert_respond_to(@object, :create_catalog)
    end
  end

  class CategoryTest < MiniTest::Unit::TestCase
    include  CatalogInterfaceTest

    def setup
      @category = @object = Category.new
    end
  end

  class ProductTest < MiniTest::Unit::TestCase
    include  CatalogInterfaceTest

    def setup
      @product = @object = Product.new
    end
  end
end