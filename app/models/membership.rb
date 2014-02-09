class Membership < ActiveRecord::Base

  validates :user_id, :uniqueness => {:scope => :beer_club_id}

  belongs_to :user
  belongs_to :beer_club
 
  def to_s
  end

  def list_users
    
  end
end
