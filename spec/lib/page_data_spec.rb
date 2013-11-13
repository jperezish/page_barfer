require_relative '../../lib/page_data'

module PageBarfer
  describe PageData do
    before do
      @product_data = [{:product_name => "Bacon"}]
      @file_path = "products.json"
      @my_import = PageData.new
      @imports_json = double("imports_json")
    end

    describe "#get_page_data_from" do
      it "sends a message to import data from a json file" do
        @imports_json.should_receive(:import).with(an_instance_of(PageData))

        @my_import.get_page_data_from(@file_path, @imports_json)
      end
    end
  end

  describe ImportsJson do
    describe "#import" do
      it "imports data from a json file"
    end
  end
end