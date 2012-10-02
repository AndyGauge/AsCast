class Auth < ActiveRecord::Base
   
   attr_accessible :key

   ##Relationships
   belongs_to :user

   ##Trigger
   before_create :generate_token

   ##methods
	def generate_token
      @token = SecureRandom.urlsafe_base64(32)
		self.key = @token
	 end
end
