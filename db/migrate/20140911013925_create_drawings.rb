class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :winner
      t.integer :winner_id
      t.integer :total_tickets
      t.integer :winner_tickets
      t.string :raffle_id

      t.timestamps
    end
  end
end
