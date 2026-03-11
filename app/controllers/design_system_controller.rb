class DesignSystemController < ApplicationController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  layout "design_system"

  def show
  end
end