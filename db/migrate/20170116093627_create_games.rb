class CreateGames < ActiveRecord::Migration
  def change
   
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :round_won, :default => 0
      t.timestamps
    end

    create_table :games do |t|
      t.belongs_to :player
      t.string :result
      t.integer :destroyed_submarine
      t.timestamps
    end


  end
end
