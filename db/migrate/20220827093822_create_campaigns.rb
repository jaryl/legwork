class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns, id: :uuid do |t|
      t.references :manager, type: :uuid, null: false, index: true
      t.references :need, type: :uuid, null: true, index: true
      t.references :pool, type: :uuid, null: true, index: true

      t.string :description

      t.datetime :start_date
      t.datetime :end_date

      t.integer :funding_goal

      t.timestamps
    end
  end
end
