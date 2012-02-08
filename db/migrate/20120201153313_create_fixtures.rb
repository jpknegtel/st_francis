class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.string "opposition"
      t.integer "team_id"
      t.integer "venue_id"
      t.date "date"
      t.timestamps
    end
  end
end
