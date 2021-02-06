class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :favorite, null: false, foreign_key: { to_table: :posts }


      t.timestamps

      t.index [:user_id, :favorite_id], unique: true
    end
  end
end
