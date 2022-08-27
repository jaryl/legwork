class CreateCases < ActiveRecord::Migration[7.0]
  def change
    create_enum :cases_status, ["draft", "active", "archived"]

    create_table :cases, id: :uuid do |t|
      t.references :beneficiary, type: :uuid, null: false, index: true

      t.enum :status, enum_type: :cases_status

      t.string :nature
      t.string :description

      t.timestamps
    end
  end

  def down
    drop_table :cases

    execute <<-SQL
      DROP TYPE cases_status;
    SQL
  end
end
