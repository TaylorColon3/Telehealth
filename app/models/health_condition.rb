# == Schema Information
#
# Table name: health_conditions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  medical_id :integer
#  user_id    :integer
#
class HealthCondition < ApplicationRecord
end
