# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Bookkeeping::Application.initialize!


Plaid.config do |config|
  config.customer_id = PLAID_CUSTOMER_ID
  config.secret = PLAID_SECRET
end
