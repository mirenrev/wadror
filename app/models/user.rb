class User < ActiveRecord::Base
  include AverageRating

  validates :username, uniqueness: true
  validates :username,length: {minimum: 3}
  validates :username,length: {maximum: 15}
  validates :password, :format => {:with => /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{4,}\z/}

  has_many :ratings, dependent: :destroy # Käyttäjällä monta ratingia
  has_many :beers, through: :ratings
  has_many :beer_clubs, through: :memberships
  has_many :memberships

  has_secure_password
end
