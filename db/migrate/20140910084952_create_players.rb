class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :tickets
      t.string :raffle_id

      t.timestamps
    end
  end
end
