module PageBarfer
  class Product
    def create_catalog(catalog)
      @products = catalog.products
      index_path = Pathname.new("products/bacon-supplies/savory/bubba/index.html")
      index_directory = index_path.dirname

      index_directory.descend do |dir|
        FileUtils.mkdir dir unless File.exist?(dir)
      end
      FileUtils.touch index_path.to_s
    end
  end
end