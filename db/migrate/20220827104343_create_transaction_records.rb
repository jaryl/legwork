class CreateTransactionRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_records, id: :uuid do |t|
      t.references :pool, type: :uuid, null: false, index: true
      t.references :transactable, polymorphic: true, index: true, null: true, type: :uuid

      t.integer :value, null: false

      t.timestamps
    end
  end
end
