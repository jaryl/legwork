class CreatePools < ActiveRecord::Migration[7.0]
  def up
    create_enum :pools_status, ["active", "inactive"]

    create_table :pools, id: :uuid do |t|
      t.references :handler, polymorphic: true, index: true, null: false, type: :uuid

      t.string :name, null: false

      t.enum :status, enum_type: :pools_status

      t.string :scheme_class, null: false
      t.jsonb :scheme_payload, null: false, default: "{}"

      t.timestamps
    end
  end

  def down
    drop_table :pools

    execute <<-SQL
      DROP TYPE pools_status;
    SQL
  end
end
