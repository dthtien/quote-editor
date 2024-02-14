require "test_helper"

class LineItemDatesControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  test "should get new" do
    login_as users(:accountant)
    quote = quotes(:first)
    get new_quote_line_item_date_url(quote)

    assert_response :success
  end
end
