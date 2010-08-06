# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jane_addams_session',
  :secret      => '3ef4e7edf1f83a88597687131566c6060978f30a341a7bf4897c2cb099f09dca6fc5c18ccf89ff75cbaea373ddea12a29a492aedc2eeab7ffc777fa3179f4a8d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
