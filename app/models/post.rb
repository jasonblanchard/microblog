class Post < ActiveRecord::Base
  attr_accessible :body

  validates :body, :length => { :maximum => 140 }
end
