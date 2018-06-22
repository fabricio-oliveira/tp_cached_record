# frozen_string_literal: true
# == Schema Information
#
# Table name: bars
#
#  id         :integer          not null, primary key
#  other      :string
#  uuid       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bar < ActiveRecord::Base
end
