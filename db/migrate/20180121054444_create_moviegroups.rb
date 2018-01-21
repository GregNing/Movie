class CreateMoviegroups < ActiveRecord::Migration[5.1]
  def change
    create_table :moviegroups do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
