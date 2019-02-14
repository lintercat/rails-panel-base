ActionMailer::Base.default_url_options = { :host => ENV.fetch('MAILER_HOST') }
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: ENV.fetch('SMTP_ADDRESS'),
  port: 587, # ports 587 and 2525 are also supported with STARTTLS
  enable_starttls_auto: true, # detects and uses STARTTLS
  user_name: 'SMTP_Injection',
  password: ENV.fetch('SMTP_PASSWORD'), # SMTP password is any valid API key
  authentication: 'login', # sparkmail
  domain: ENV.fetch('SMTP_DOMAIN'), # your domain to identify your server when connecting
}
