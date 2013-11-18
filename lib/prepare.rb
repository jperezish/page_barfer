require 'pathname'
require 'fileutils'

module PageBarfer
  class Prepare
    def self.create(jekyll_site_name)
      @jekyll_site_name = jekyll_site_name
      @config_path = Pathname.new("#{@jekyll_site_name}/_plugins/page_barfer/page_barfer_config.yml")
      @page_barfer_directory = @config_path.dirname

      @page_barfer_directory.descend do |dir|
        FileUtils.mkdir dir unless File.exist?(dir)
      end

      FileUtils.touch @config_path.to_s
    end
  end
end