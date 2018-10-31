# == Schema Information
#
# Table name: pins
#
#  id         :integer          not null, primary key
#  user       :integer
#  reachout   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pin < ApplicationRecord

end
