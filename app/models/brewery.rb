class Brewery < ActiveRecord::Base
  include AverageRating

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :name, presence: true

  validates :year, numericality: {
                                  greater_than_or_equal_to: 1042,
                                  only_integer: true
                                 }
  validate :year_cannot_be_future

  def year_cannot_be_future
    if self.year > Date.today.year
      errors.add(:year, "Can't be in the future")
    end
  end
  def to_s
    "#{name}"
  end

  def print_report
    puts name
    puts "Established at year #{year}"
    puts "Number of beers: #{beers.count}"
    puts "Numberof ratings: #{ratings.count}"
  end

  def restart
    self.year = 2014
    puts "Changed year to #{year}"
  end
end
