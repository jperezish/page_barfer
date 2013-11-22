require 'fileutils'

After do
  FileUtils.rm_rf('tmp/aruba/bacon-store')
end