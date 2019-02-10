class FileUploader < CarrierWave::Uploader::Base
  # Storage configuration within the uploader supercedes the global CarrierWave
  # config, so either comment out `storage :file`, or remove that line, otherwise
  # AWS will not be used.
  storage :aws

  # You can find a full list of custom headers in AWS SDK documentation on
  # AWS::S3::S3Object
  def download_url(filename)
    url(response_content_disposition: %Q{attachment; filename="#{filename}"})
  end

  def store_dir
    root_folder = 'Panel' # ENV.fetch("AWS_S3_BUCKET_FOLDER")
    "#{root_folder}/#{model.class.to_s.underscore}/#{model.id}"
  end
end
