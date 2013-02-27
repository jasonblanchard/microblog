class Post < ActiveRecord::Base
  attr_accessible :body
  has_many :comments, :dependent => :destroy

  validates :body, :length => { :maximum => 140, :message => "Gotta be less than 140 characters!" }
  validates :body, :presence => { :message => "You've gotta put something..." }

  def has_comments?
      comments.length > 0
  end
end
