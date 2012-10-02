class CreateSourceType < ActiveRecord::Migration
  def change
    create_table :source_types do |t|

    	t.string :name
    	t.integer :flags

      t.timestamps
    end
  end
end
