class CreateNicknames < ActiveRecord::Migration[6.0]
  def change
    create_table :nicknames do |t|
      t.string :nickname

      t.timestamps
    end
  end
end
