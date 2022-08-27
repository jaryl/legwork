class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers, id: :uuid do |t|
      t.string :contact_number

      t.timestamps
    end
  end
end
