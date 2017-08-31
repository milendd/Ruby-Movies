class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :duration # in minutes
      t.text :description
      t.string :genre
    end
  end
end
