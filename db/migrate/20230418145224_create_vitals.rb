class CreateVitals < ActiveRecord::Migration[6.0]
  def change
    create_table :vitals do |t|
      t.integer :user_id
      t.string :health_conditions

      t.timestamps
    end
  end
end
