require './test/test_helper'

class UsersHelperTest < ActionView::TestCase
  test "gravatar_for" do
    name = "Michael Hartl"
    email = "michael@example.com"
    email_hash = Digest::MD5::hexdigest(email.downcase)

    user = User.new(
      name: name,
      email: email,
    )
    actual = gravatar_for(user)
    expected = "<img alt=\"#{name}\" class=\"gravatar\" src=\"https://secure.gravatar.com/avatar/#{email_hash}?s=50\" />"
    assert_equal expected, actual
  end

  test "gravatar_for with size" do
    name = "Michael Hartl"
    email = "michael@example.com"
    email_hash = Digest::MD5::hexdigest(email.downcase)

    user = User.new(
      name: name,
      email: email,
    )
    actual = gravatar_for(user, size: 80)
    expected = "<img alt=\"#{name}\" class=\"gravatar\" src=\"https://secure.gravatar.com/avatar/#{email_hash}?s=80\" />"
    assert_equal expected, actual
  end
end
