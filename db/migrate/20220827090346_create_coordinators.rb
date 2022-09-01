class CreateCoordinators < ActiveRecord::Migration[7.0]
  def change
    create_table :coordinators, id: :uuid do |t|
      t.jsonb :contact_methods, null: false, default: []

      t.timestamps
    end
  end
end
