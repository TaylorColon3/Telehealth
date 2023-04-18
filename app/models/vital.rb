# == Schema Information
#
# Table name: vitals
#
#  id                :integer          not null, primary key
#  health_conditions :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#
class Vital < ApplicationRecord
end
