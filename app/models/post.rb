class Post < ActiveRecord::Base
  attr_accessible :body
  has_many :comments, :dependent => :destroy

  validates :body, :length => { :maximum => 140 }

  def has_comments?
      comments.length > 0
  end
end
