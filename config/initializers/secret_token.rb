# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = 'b5b6279b716e3f84bfbced5cceeeb3e596af64fc95c49f27095a3fd6d10984eb9620cfab1345bf412f3b30acb5f1f98e1a2172724ad99c9d83a0f3627db42c57'
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exists?(token_file)
		#Use the existing token.
		File.read(token_file).chomp
	else
		#Geneate a new token and store it in a token_file.
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

SampleApp::Application.config.secret_key_base = secure_token