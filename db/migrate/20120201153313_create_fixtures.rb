class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.string "opposition"
      t.belongs_to "team"
      t.belongs_to "venue"
      t.datetime "date"
      t.timestamps
    end
  end
end
