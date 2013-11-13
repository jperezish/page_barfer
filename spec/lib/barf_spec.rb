require_relative '../../lib/barf'

module PageBarfer
  describe Barf do
    before do
      @products_file = double("data_file")
      @layout        = double("layout")
      @page_data = double("page_data")
      @page_data.stub(:get_content_variables).and_return("data")
      @page_layout_importer.stub(:get_layout_from).and_return("layout")
    end

    describe "#generate_pages_from" do
      it "gets page data from page importer" do
        @page_data.get_content_variables(@products_file)

        expect(@page_data.get_content_variables(@products_file)).to eq("data")
      end
      it "gets the page layout from layouts" do

        expect(@page_layout_importer.get_layout_from(@page_layout)).to eq("layout")
      end
    end
  end
end