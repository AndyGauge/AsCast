class Race < ActiveRecord::Base
  attr_accessible :name, :slug, :ballot

  has_many :choice

  ##Methods
  def self.find_or_create(_slug)
  	if @r = Race.find(:slug => _slug)
  	  @r
  	end
  	@r = Race.new({:slug => _slug})
  	@r.save()
  	@r 
  end
  
end
