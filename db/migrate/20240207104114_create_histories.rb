class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.integer :history_id
      t.string :description
      t.references :source_account, null: false, foreign_key: true
      t.references :destination_account, null: false, foreign_key: true
      t.date :transaction_date
      t.boolean :status

      t.timestamps
    end
  end
end
