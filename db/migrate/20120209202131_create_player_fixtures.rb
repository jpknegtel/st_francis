class CreatePlayerFixtures < ActiveRecord::Migration
  def change
    create_table :player_fixtures do |t|
      t.integer  "player_ID"
      t.integer  "fixture_ID"
      t.boolean  "sub_paid"

      t.timestamps
    end
  end
end
