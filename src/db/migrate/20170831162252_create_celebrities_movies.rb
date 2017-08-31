class CreateCelebritiesMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :celebrities_movies do |t|
      t.belongs_to :movies, foreign_key: true
      t.belongs_to :celebrities, foreign_key: true
      t.belongs_to :celebrity_types, foreign_key: true
    end
  end
end
