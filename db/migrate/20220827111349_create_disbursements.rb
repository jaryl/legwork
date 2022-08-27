class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements, id: :uuid do |t|
      t.references :need, type: :uuid, null: false, index: true

      t.timestamps
    end
  end
end
