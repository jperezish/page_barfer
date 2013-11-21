module PageBarfer

  class ImportsJson
    def import(page_data)
      JSON.parse(IO.read(page_data.file_path))
    end
  end

end