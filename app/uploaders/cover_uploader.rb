class CoverUploader < BaseUploader
  version :thumb do
    process resize_and_pad: [300, 300]
  end
end
