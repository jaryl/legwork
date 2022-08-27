class CreateUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :updates, id: :uuid do |t|
      t.references :campaign, type: :uuid, null: false, index: true
      t.references :manager, type: :uuid, null: false, index: true

      t.string :body

      t.timestamps
    end
  end
end
