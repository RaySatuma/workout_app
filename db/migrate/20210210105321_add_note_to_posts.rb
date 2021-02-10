class AddNoteToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :note, :text
  end
end
