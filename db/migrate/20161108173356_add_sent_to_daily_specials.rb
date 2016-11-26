class AddSentToDailySpecials < ActiveRecord::Migration
  def change
    add_column :daily_specials, :sent, :string, :default => "false"
  end
end
