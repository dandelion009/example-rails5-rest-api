# == Schema Information
#
# Table name: hooks
#
#  id         :uuid             not null, primary key
#  threshold  :integer          default("0")
#  callback   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class HookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
