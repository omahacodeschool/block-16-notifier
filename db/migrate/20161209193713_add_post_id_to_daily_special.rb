class AddPostIdToDailySpecial < ActiveRecord::Migration
  def change
    add_column :daily_specials, :postID, :string
  end
end
