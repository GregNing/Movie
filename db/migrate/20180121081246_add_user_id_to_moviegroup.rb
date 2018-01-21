class AddUserIdToMoviegroup < ActiveRecord::Migration[5.1]
  def change    
    add_column :moviegroups, :user_id, :integer
    
  end
end
