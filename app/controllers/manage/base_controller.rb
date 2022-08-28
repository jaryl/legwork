class Manage::BaseController < ApplicationController
  before_action :authorise_current_manager!

  private

  def current_manager
    @current_manager ||= current_account.profiles.managers.sole.profileable
    # TODO: handle case when current account does not have a manager profile
  # rescue ActiveRecord::RecordNotFound
  #   nil
  end

  def authorise_current_manager!
    # TODO: replace with not authorised custom exception
    raise "Forbidden" if current_manager.blank?
  end
end
