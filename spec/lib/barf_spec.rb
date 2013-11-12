require_relative '../../lib/barf'

module PageBarfer
  describe Barf do
    before do
      @products_file = double("data_file")
      @layout        = double("layout")
      @page_importer = double("page_importer")
      @page_importer.stub(:get_page_data_from).and_return("data")
      @page_layout_importer.stub(:get_layout_from).and_return("layout")
    end

    describe "#generate_pages_from" do
      it "gets page data from page importer" do
        @page_importer.get_page_data_from(@products_file)

        expect(@page_importer.get_page_data_from(@products_file)).to eq("data")
      end
      it "gets the page layout from layouts" do

        expect(@page_layout_importer.get_layout_from(@page_layout)).to eq("layout")
      end
    end
  end
end