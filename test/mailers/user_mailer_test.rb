require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "confirm" do
    mail = UserMailer.confirm
    assert_equal "Confirm", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "forgot" do
    mail = UserMailer.forgot
    assert_equal "Forgot", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "repeat_token" do
    mail = UserMailer.repeat_token
    assert_equal "Repeat token", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
