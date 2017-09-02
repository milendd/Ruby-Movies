class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      
      # duration is in minutes
      t.integer :duration 
      t.text :description
      t.string :genre
    end
  end
end
