if Rails.env.development? or Rails.env.test?
  PLAID_CLIENT_ID = "53b1a97a101640ffe0182b5e"
  PLAID_SECRET = "8aIxgEK6q8JN2AkgxkYN8D"
elsif Rails.env.production?
  PLAID_CLIENT_ID = "53b1a97a101640ffe0182b5e"
  PLAID_SECRET = "8aIxgEK6q8JN2AkgxkYN8D"
end
