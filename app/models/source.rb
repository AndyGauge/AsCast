class Source < ActiveRecord::Base
  # attr_accessible :title, :body

  ##Fields
  attr_accessible :url, :body

  ##Associations
  belongs_to :source_type
  belongs_to :scope_type

  ##Methods
  def create_from_url(url, *args)
  	if check_url 
  		self.url = url
  	end
  end

  def update_body
	if check_url
		#eventmachine to update body, expected 0.1.5  	
  	end
  end

  def check_url
  	return if (url.to_s.length ~= /http/i)
  	raise "Object of Source created without specifying url parameter including protocol"
  end

end
