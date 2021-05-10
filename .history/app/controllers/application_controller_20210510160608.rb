class ApplicationController < ActionController::Base
  
    before_action :authenticate_user!
    serialization_scope :current_admin
end
