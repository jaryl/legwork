class CreateDonors < ActiveRecord::Migration[7.0]
  def change
    create_table :donors, id: :uuid do |t|
      t.string :name, null: false
      t.string :contact_number

      t.timestamps
    end
  end
end
