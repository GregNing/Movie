class CreateMoviegroupRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :moviegroup_relationships do |t|
      t.integer :moviegroup_id
      t.integer :user_id

      t.timestamps
    end
  end
end
