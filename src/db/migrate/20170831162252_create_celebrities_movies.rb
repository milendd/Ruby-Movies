class CreateCelebritiesMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :celebrities_movies do |t|
      t.belongs_to :movie, foreign_key: true
      t.belongs_to :celebrity, foreign_key: true
      t.belongs_to :celebrity_type, foreign_key: true
    end
  end
end
