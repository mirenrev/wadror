class BeerClub < ActiveRecord::Base
  has_many :users, through: :membership
  has_many :memberships

  def to_s
    
  end
end
