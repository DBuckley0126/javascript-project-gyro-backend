class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|

      t.integer :join_code,

      t.timestamps
    end
  end
end
