# frozen_string_literal: true
# == Schema Information
#
# Table name: pepes
#
#  id         :integer          not null, primary key
#  other      :string
#  uuid       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pepe < ActiveRecord::Base
  acts_as_unique
end
