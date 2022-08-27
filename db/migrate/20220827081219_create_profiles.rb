class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles, id: :uuid do |t|
      t.references :account, foreign_key: true, index: true, null: false, type: :uuid
      t.references :profileable, polymorphic: true, index: true, null: false, type: :uuid

      t.string :display_name, null: false

      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end
