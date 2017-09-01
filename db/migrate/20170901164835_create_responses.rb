class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.text :content
      t.integer :next_message
      t.boolean :end_game
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
