class CreateMedicalInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_inquiries do |t|
      t.integer :user_id
      t.string :patient_message
      t.text :ai_recommendation

      t.timestamps
    end
  end
end
