class Pin < ActiveRecord::Base
  acts_as_votable 
  belongs_to :user
  belongs_to :character
  has_many :comments, :dependent => :destroy
  has_attached_file :image, styles: { medium: "300x300>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :title, uniqueness: true

  def ordered_comments
    self.comments.order("created_at DESC")
  end
  
end
