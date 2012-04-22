class CreatePlayersTeamsJoin < ActiveRecord::Migration
  def up
    create_table :player_teams, :id =>false do |t|
      t.integer "player_id"
      t.integer "team_id"
    end
    add_index :player_teams, ["player_id","team_id"]
  end

  def down
    drop_table :player_teams


  end
end
