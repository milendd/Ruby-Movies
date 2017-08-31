class Movie < ActiveRecord::Base
  has_many :celebrities_movies
  has_many :ratings
end
