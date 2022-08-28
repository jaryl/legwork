class CreateBeneficiaries < ActiveRecord::Migration[7.0]
  def up
    create_enum :beneficiaries_gender, ["male", "female"]

    create_table :beneficiaries, id: :uuid do |t|
      t.string :full_name, null: false
      t.enum :gender, enum_type: :beneficiaries_gender

      t.string :contact_number
      t.string :email
      t.string :address

      t.timestamps
    end
  end

  def down
    drop_table :beneficiaries

    execute <<-SQL
      DROP TYPE beneficiaries_gender;
    SQL
  end
end
