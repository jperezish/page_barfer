require 'pathname'
require 'fileutils'

module PageBarfer
  class Prepare
    def self.create(jekyll_site_name)
      @jekyll_site_name = jekyll_site_name
      @config_path = Pathname.new("#{@jekyll_site_name}/_page_barfer/_page_barfer_config.yml")
      @page_barfer_directory = @config_path.dirname

      FileUtils.mkdir @page_barfer_directory
      FileUtils.touch @config_path.to_s
    end
  end
end