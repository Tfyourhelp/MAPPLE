require "test_helper"

class ShopMailerTest < ActionMailer::TestCase
  test "order_from_customer" do
    mail = ShopMailer.order_from_customer
    assert_equal "Order from customer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
