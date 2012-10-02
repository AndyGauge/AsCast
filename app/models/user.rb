class User < ActiveRecord::Base
	#User class is used to track customers who can log in.  Applications 
	attr_accessible :name, :email, :password

	#Class Variable
	@@salt = '$2a$10$AzFIE6EQpNFGcnLIKNjQvO'

	##Relationships
	has_one :auth

	##Trigger
	before_create :generate_auth

	##Methods
	def self.make(_name, _email, _password)
		@tmp_user = User.new()
		@tmp_user.name = _name
		@tmp_user.email = _email
		@tmp_user.password = BCrypt::Engine.hash_secret(_password, @@salt)
		@tmp_user.save()
		@tmp_user
	end

	def generate_auth
		create_auth
		auth.key = auth.generate_token
		auth.save()
		true
	end



################Only should be used in debug#############
	def self.validate_user(_email, _password) 
		if(User.find_by_email_and_password(_email , BCrypt::Engine.hash_secret(_password, @@salt)))
			return true
		else
			return false
		end
	end

end  # Class User
