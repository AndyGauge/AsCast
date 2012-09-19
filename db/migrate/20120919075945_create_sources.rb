class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|

    	t.string :url
    	t.text :body
    	t.timestamp :last_checked
    	
    	##Relationships
    	t.int :source_type_id
    	t.int :scope_type_id

      t.timestamps
    end
  end
end
