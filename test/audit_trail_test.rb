require 'test_helper'

class AuditTrailTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, AuditTrail
  end
end
