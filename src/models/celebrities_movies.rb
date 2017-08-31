class CelebritiesMovies < ActiveRecord::Base
  belongs_to :movie
  belongs_to :celebrity
  belongs_to :celebrity_type
end
