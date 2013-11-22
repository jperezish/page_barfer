module PageBarfer

  class ImportsJson
    def import(products)
      JSON.parse(IO.read(page_data.file_path))
    end
  end

end