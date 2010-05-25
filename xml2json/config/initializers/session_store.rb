# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_xml2json_session',
  :secret      => 'f98476d6f28bf18b867a58f8ac1386db78de2548ecbddbedc056d9881c830a593f960b6ac5e0f268809cba20d9f58b67109d60df24aa32ee04bd4bcd302eccf1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
