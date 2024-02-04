class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :card_type
      t.integer :power
      t.integer :cost
      t.integer :set_id
      t.string :rarity
      t.text :card_attributes

      t.timestamps
    end
  end
end
