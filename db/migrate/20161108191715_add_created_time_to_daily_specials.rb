class AddCreatedTimeToDailySpecials < ActiveRecord::Migration
  def change
    add_column :daily_specials, :created_time, :string
  end
end
