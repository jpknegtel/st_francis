class CreatePlayerFixtures < ActiveRecord::Migration
  def change
    create_table :player_fixtures do |t|
      t.integer  "player_id"
      t.integer  "fixture_id"
      t.boolean  "sub_paid"

      t.timestamps
    end
  end
end
