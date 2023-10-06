class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :authenticate_user!

  private

  def layout_by_resource
    if devise_controller? #Add later: skip landing if logged in.
      "landing"
    else
      "application"
    end
  end
end
