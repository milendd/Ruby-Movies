class Celebrity < ActiveRecord::Base
  has_many :celebrities_movies
end
