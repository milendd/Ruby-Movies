class CreateCelebrities < ActiveRecord::Migration[5.1]
  def change
    create_table :celebrities do |t|
      t.string :name
      t.string :nacionality
      t.timestamp :birthday
    end
  end
end
