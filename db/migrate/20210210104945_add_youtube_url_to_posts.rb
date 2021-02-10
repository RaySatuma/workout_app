class AddYoutubeUrlToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :youtube_url, :string
  end
end
