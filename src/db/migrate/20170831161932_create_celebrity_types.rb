class CreateCelebrityTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :celebrity_types do |t|
      t.string :name
    end
  end
end
