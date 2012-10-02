class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|

    	t.string :url
    	t.text :body
    	t.timestamp :last_checked
      t.integer :source_type_id
    	
    	##Relationships
    	#t.references :source_type

      t.timestamps
    end
  end
end
