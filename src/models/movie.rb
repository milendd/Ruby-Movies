class Movie < ActiveRecord::Base
  has_many :celebrities_movies, dependent: :destroy
  has_many :ratings
end
