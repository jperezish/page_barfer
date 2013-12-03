require_relative '../lib/catalog_settings'
require_relative 'spec_helper'

module PageBarfer

  describe CatalogSettings do
    before do
      @config_file = "_page_barfer.yml"
    end

    describe "#self.configure" do

      it "creates a page barfer config file" do
        CatalogSettings.configure

        assert File.exist?(@config_file),
          "'#{@config_file}' not found."
      end
    end

    after do
      FileUtils.rm_rf("_page_barfer.yml")
    end
  end
end