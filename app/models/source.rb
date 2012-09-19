
class Source < ActiveRecord::Base
  # attr_accessible :title, :body

  ##Fields
  attr_accessible :url, :body

  ##Associations
  belongs_to :source_type
  belongs_to :scope_type

  ##Validators
  before_save :check_url

  ##Methods
  #def initialize
  # Source.new({:url => "http://sub.main.tld/route"})
  
  
  def update_body
	if check_url
		#eventmachine to update body, expected 0.1.5  	
  	end
  end

  def check_url
  	if (url !~ /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/i)
  		raise "Object of Source created without specifying url parameter including protocol"
  	end
  	return
  end

end
