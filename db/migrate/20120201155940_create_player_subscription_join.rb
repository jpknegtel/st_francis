class CreatePlayerSubscriptionJoin < ActiveRecord::Migration
  def up
  create_table :subscriptions_players, :id =>false do |t|
      t.integer "player_id"
      t.integer "subscription_id"
    end
    add_index :subscriptions_players, ["player_id","subscription_id"]
  end

  def down
    drop_table :subscriptions_players

  end
  end
