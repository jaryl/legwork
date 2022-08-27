class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools, id: :uuid do |t|
      t.references :handler, polymorphic: true, index: true, null: false, type: :uuid

      t.string :name, null: false

      t.string :scheme_class, null: false
      t.jsonb :scheme_payload, null: false, default: "{}"

      t.timestamps
    end
  end
end
