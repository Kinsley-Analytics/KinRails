class DesignSystemController < ApplicationController
  skip_after_action :verify_authorized

  layout "design_system"

  def show
  end
end