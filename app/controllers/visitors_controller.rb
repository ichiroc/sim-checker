class VisitorsController < ApplicationController
  before_action :redirect_to_setting, if: -> { user_signed_in? }

  def index; end

  private

  def redirect_to_setting
    redirect_to edit_setting_path
  end
end
