
class Source < ActiveRecord::Base
  # Source Controller used to receive locations of documents
  # Initialize as:
  # Source.new({:url => "http://sub.main.tld/route"})

  require 'net/http'

  ##Fields
  attr_accessible :url, :body

  ##Associations
  belongs_to :source_type
  has_one :parser

  ##Validators
  before_save :check_url

  ##Methods

  def self.create_from_url(_url)
    @s = Source.new(:url => _url)
    @s.save()
    @s
  end


  def update_body
  	if check_url
	 	   self.body = Net::HTTP.get(URI(url))
       self.save()
       body
  	end
  end

  def check_url
  	if (url !~ /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/i)
  		raise "Object of Source created without specifying url parameter including protocol"
  	end
  	return true
  end
end