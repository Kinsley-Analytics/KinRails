require "axe-capybara"
require "axe/matchers/be_axe_clean"

module AccessibilityHelper
  def assert_accessible(page = self.page)
    axe = Axe::Matchers::BeAxeClean.new
    result = axe.matches?(page)

    assert result, axe.failure_message
  end
end
