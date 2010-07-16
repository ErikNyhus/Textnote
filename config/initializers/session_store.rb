# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_apsalar_session',
  :secret      => 'a7b3862ec6f9e41712cc88f42ae7c3a96404138826f18861bec62ca3a9386305594489032e0cd6f42435a672d6b5db20a62a772142c7224737dcd48ce800a1e5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
