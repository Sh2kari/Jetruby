class LessonCoverUploader < BaseUploader
  version :thumb do
    process resize_and_pad: [200, 200]
  end

  version :admin_thumb do
    process resize_and_pad: [150, 150]
  end
end
