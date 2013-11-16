require_relative '../lib/prepare'
require_relative 'spec_helper'
require 'fileutils'
require 'pathname'

module PageBarfer

  describe Prepare do
    before do
      @jekyll_site_name = "bacon-store"
      @config_path = Pathname.new("#{@jekyll_site_name}/_page_barfer/_page_barfer_config.yml")
      @page_barfer_directory = @config_path.dirname
      @page_barfer_config_file = @config_path.basename

      Dir.mkdir(@jekyll_site_name)
    end

    describe "#self.create" do
      it "creates a page barfer folder" do
        Prepare.create(@jekyll_site_name)

        assert File.exist?(@page_barfer_directory),
          "Jekyll directory '#{@page_barfer_directory}' not found."
      end

      it "creates a page barfer config file" do
        Prepare.create(@jekyll_site_name)

        assert File.exist?(@config_path.to_s),
          "'#{@config_path.to_s}' not found."
      end

      it "checks to see if Jekyll is installed" do
        skip
        FileUtils.rm_rf(@jekyll_site_name)

        Prepare.create(@jekyll_site_name)
      end
    end

    after do
      FileUtils.rm_rf(@jekyll_site_name)
    end
  end
end