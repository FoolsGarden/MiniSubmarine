class CreateGames < ActiveRecord::Migration
  def change
   
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.timestamps
    end

    create_table :games do |t|
      t.belongs_to :player
      t.string :result
      t.integer :destroyed_submarine
      t.integer :round_won
      t.timestamps
    end


  end
end
