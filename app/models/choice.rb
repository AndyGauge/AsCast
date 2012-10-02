class Choice < ActiveRecord::Base
  attr_accessible :name, :votes

  belongs_to :race
end
