class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments, id: :uuid do |t|
      t.references :case, foreign_key: true, index: true, null: false, type: :uuid
      t.references :manager, foreign_key: true, index: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
