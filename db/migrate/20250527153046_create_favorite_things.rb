class CreateFavoriteThings < ActiveRecord::Migration[7.1]
  def change
    create_table :favorite_things do |t|
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
