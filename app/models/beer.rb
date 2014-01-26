class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings

  def average_rating
    sc = 0
    ratings.each {|rating|
      sc = sc + rating.score
    }
    avg = sc / ratings.count
    "#{avg}"
  end
end
