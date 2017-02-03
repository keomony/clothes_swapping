if Rails.env.development? || Rails.env.test?
  Paperclip::Attachment.default_options[:storage] = "filesystem"
  Paperclip::Attachment.default_options[:path] = "#{Rails.root}/spec/files/images/testing"
elsif Rails.env.production?
  Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
  Paperclip::Attachment.default_options[:s3_host_name] = 's3-eu-west-2.amazonaws.com'
  Paperclip::Attachment.default_options[:s3_credentials] = {
                        :bucket => ENV.fetch('AWS_BUCKET'),
                        :access_key_id => ENV.fetch('AWS_ACCESS_KEY_ID'),
                        :secret_access_key => ENV.fetch('AWS_SECRET_ACCESS_KEY'),
                        :s3_region => ENV.fetch('AWS_REGION'),
                      }
end
