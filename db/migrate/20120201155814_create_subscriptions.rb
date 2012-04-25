class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string "sub_type"

      t.timestamps
    end
  end
end
