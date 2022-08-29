class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def current_coordinator
    @current_coordinator ||= current_account.profiles.coordinators.sole.profileable
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def authorise_current_coordinator!
    raise Pundit::NotAuthorizedError, "not a coordinator" if current_coordinator.blank?
  end

  def current_manager
    @current_manager ||= current_account.profiles.managers.sole.profileable
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def authorise_current_manager!
    raise Pundit::NotAuthorizedError, "not a manager" if current_manager.blank?
  end

  def current_admin
    @current_admin ||= current_account.profiles.admins.sole.profileable
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def authorise_current_admin!
    raise Pundit::NotAuthorizedError, "not an admin" if current_admin.blank?
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back fallback_location: my_root_path
  end
end
