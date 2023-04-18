class CreateHealthConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :health_conditions do |t|
      t.integer :user_id
      t.integer :medical_id

      t.timestamps
    end
  end
end
