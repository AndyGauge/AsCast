class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|

    	t.string :url
    	t.text :body
    	t.timestamp :last_checked
    	
    	##Relationships
    	t.integer :source_type_id
    	t.integer :scope_type_id

      t.timestamps
    end
  end
end
