class User < ActiveRecord::Base
  include AverageRating

  validates :username, uniqueness: true
  validates :username,length: {minimum: 3}
  validates :username,length: {maximum: 15}

  has_many :ratings # Käyttäjällä monta ratingia
  has_many :beers, through: :ratings
end
