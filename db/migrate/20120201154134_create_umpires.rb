class CreateUmpires < ActiveRecord::Migration
  def change
    create_table :umpires do |t|
      t.string "name"

      t.timestamps
    end
  end
end
