class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :name
      t.integer :votes
      t.integer :race_id

      t.timestamps
    end
  end
end
