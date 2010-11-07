# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_semac_session',
  :secret      => '50eb6d27d7961e0e58196533c1763d6c6e029e7792cd3a9a414879d182e437947b6286ad84bcfb9ac4786f7a4060e9a51e49a09209e5e8476170ee7018b63735'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
