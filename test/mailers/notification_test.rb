require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "assign" do
    mail = Notification.assign
    assert_equal "Assign", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
