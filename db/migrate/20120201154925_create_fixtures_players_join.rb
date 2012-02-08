class CreateFixturesPlayersJoin < ActiveRecord::Migration
  def up
  create_table :fixtures_players, :id =>false do |t|
      t.integer "player_id"
      t.integer "fixture_id"
    end
    add_index :fixtures_players, ["player_id","fixture_id"]
  end

  def down
    drop_table :fixtures_players
  end
  end
