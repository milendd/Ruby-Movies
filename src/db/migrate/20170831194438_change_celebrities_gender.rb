class ChangeCelebritiesGender < ActiveRecord::Migration[5.1]
  def change
    change_table(:celebrities) do |t|
      t.string :gender
    end
  end
end
