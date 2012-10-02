class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.string :slug
      t.string :ballot

      t.timestamps
    end
  end
end
