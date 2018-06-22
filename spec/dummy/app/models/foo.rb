# frozen_string_literal: true
# == Schema Information
#
# Table name: foos
#
#  id         :integer          not null, primary key
#  other      :string
#  uuid       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Foo < ActiveRecord::Base
  acts_as_unique
end
