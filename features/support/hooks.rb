require 'fileutils'

After do
  FileUtils.rm_rf('tmp/aruba/bacon-supplies')
  FileUtils.rm_rf('tmp/aruba/_page_barfer_config.yml')
  FileUtils.rm_rf('tmp/aruba/products.json')
end