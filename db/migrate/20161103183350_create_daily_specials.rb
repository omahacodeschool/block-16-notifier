class CreateDailySpecials < ActiveRecord::Migration
  def change
    create_table :daily_specials do |t|
      t.text :text
      t.text :photo

      t.timestamps null: false
    end
  end
end
