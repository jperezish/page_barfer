require 'json'

module PageBarfer

  class Catalog
    attr_reader :source_data_for_pages, :file_path

    def get_content_variables(file_path, data_source)
      @file_path = file_path
      @source_data_for_pages = data_source.import(self)
    end
  end

  class ImportsJson
    def import(page_data)
      JSON.parse(File.read(page_data.file_path))
    end
  end
end