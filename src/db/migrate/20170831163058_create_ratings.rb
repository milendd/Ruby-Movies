class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.belongs_to :movies, foreign_key: true
      t.belongs_to :users, foreign_key: true
      t.integer :rate      
    end
  end
end
