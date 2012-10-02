class CreateAuths < ActiveRecord::Migration
  def change
    create_table :auths do |t|
    	t.integer :user_id
    	t.string :key

      t.timestamps
    end
    add_index(:auths, :key)
  end
end
