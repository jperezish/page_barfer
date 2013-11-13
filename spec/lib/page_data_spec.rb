require_relative '../../lib/page_data'

module PageBarfer

  describe PageData do
    before do
      @file_path = "products.json"
      @my_page_data = PageData.new
    end

    describe "#get_content_variables" do
      it "sends a message to import data from a json file" do
        @imports_json = double("imports_json")
        @imports_json.should_receive(:import).with(an_instance_of(PageData))

        @my_page_data.get_content_variables(@file_path, @imports_json)
      end

      it "provides access to variables" do
        imports_json = ImportsJsonDouble.new
        @my_page_data.get_content_variables(@file_path, imports_json)

        expect(@my_page_data.source_data_for_pages.first["product_name"]).to eq("Bacon")
      end
    end
  end

  describe ImportsJson do
    before do
      @imports_json = ImportsJson.new
      @file_path = "products.json"
      @my_page_data = double("page_data")
    end

    describe "#import" do
      it "imports data from a json file"
    end
  end

# Test Doubles
  class ImportsJsonDouble
    def import(page_data)
      [{"product_name" => "Bacon"}]
    end
  end
end