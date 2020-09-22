class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :caption
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
