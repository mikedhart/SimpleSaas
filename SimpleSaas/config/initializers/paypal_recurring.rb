require "paypal/recurring"

PayPal::Recurring.configure do |config|
  config.sandbox = true
  config.username = "payments_api1.mikedhart.co.uk"
  config.password = "1368428914"
  config.signature = "AFcWxV21C7fd0v3bYYYRCpSSRl31ASk1k2FTzP5M7HJEGPIP5juZ6pH9"
end