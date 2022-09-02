class CreateCampaigns < ActiveRecord::Migration[7.0]
  def up
    create_enum :campaigns_status, ["draft", "active", "closed"]

    create_table :campaigns, id: :uuid do |t|
      t.references :manager, type: :uuid, null: false, index: true
      t.references :need, type: :uuid, null: true, index: true
      t.references :pool, type: :uuid, null: true, index: true

      t.enum :status, enum_type: :campaigns_status, null: false

      t.string :title
      t.string :description

      t.datetime :start_date
      t.datetime :end_date

      t.integer :funding_goal

      t.timestamps
    end
  end

  def down
    drop_table :campaigns

    execute <<-SQL
      DROP TYPE campaigns_status;
    SQL
  end
end
