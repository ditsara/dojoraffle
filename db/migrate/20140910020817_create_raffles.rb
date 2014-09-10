class CreateRaffles < ActiveRecord::Migration
  def change
    create_table :raffles do |t|
      t.string :sig
      t.string :email

      t.timestamps
    end
    add_index :raffles, :sig
  end
end
