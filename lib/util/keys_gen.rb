Module keys_gen do
  def generate_token
    begin
      token = SecureRandom.urlsafe_base64
    end while ModelName.where(:token => token).exists?
    self.token = token
  end