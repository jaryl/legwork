class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations, id: :uuid do |t|
      t.references :donor, type: :uuid, null: false, index: true

      t.timestamps
    end
  end
end
