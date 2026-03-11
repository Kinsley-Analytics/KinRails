require "application_system_test_case"

class SmokeTest < ApplicationSystemTestCase
  test "home page is accessible" do
    visit root_url
    assert_accessible
  end
end
