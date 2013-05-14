SimpleSaas
==========
Create an initializer with the following:

<pre>
<code>
require "paypal/recurring"

PayPal::Recurring.configure do |config|
  config.sandbox = true
  config.username = "payments_api1.mikedhart.co.uk"
  config.password = "1368428914"
  config.signature = "AFcWxV21C7fd0v3bYYYRCpSSRl31ASk1k2FTzP5M7HJEGPIP5juZ6pH9"
end
</code>
</pre>

Add a row(s) to the simple_saas_payment_methods table using one or more of the following names
- paypal_recurring
- paypal_express

All entries in the simple_saas_subcscription_types table must relate to one of the above payment methods
