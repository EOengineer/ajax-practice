class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.string :details, null: false
      t.integer :difficulty, null: false
      t.timestamps
    end
  end
end
