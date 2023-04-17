# == Schema Information
#
# Table name: medical_inquiries
#
#  id                :integer          not null, primary key
#  ai_recommendation :text
#  patient_message   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#
class MedicalInquiry < ApplicationRecord
end
