class CreateNeeds < ActiveRecord::Migration[7.0]
  def up
    create_enum :needs_status, ["draft", "active", "archived"]

    create_table :needs, id: :uuid do |t|
      t.references :beneficiary, type: :uuid, null: false, index: true
      t.references :manager, type: :uuid, null: false, index: true
      t.references :label, type: :uuid, null: false, index: true

      t.enum :status, enum_type: :needs_status, null: false

      t.string :description

      t.timestamps
    end
  end

  def down
    drop_table :needs

    execute <<-SQL
      DROP TYPE needs_status;
    SQL
  end
end
