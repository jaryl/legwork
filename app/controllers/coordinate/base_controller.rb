class Coordinate::BaseController < ApplicationController
  before_action :authorise_current_coordinator!

  private

  def current_coordinator
    @current_coordinator ||= current_account.profiles.coordinators.sole.profileable
    # TODO: handle case when current account does not have a coordinator profile
  # rescue ActiveRecord::RecordNotFound
  #   nil
  end

  def authorise_current_coordinator!
    # TODO: replace with not authorised custom exception
    raise "Forbidden" if current_coordinator.blank?
  end

  def current_pool
    @current_pool ||= current_coordinator.pools.active.sole
  rescue ActiveRecord::RecordNotFound
    nil
  end
end
