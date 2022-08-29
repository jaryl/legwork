class Coordinate::BaseController < ApplicationController
  before_action :authorise_current_coordinator!

  private

  def current_pool
    @current_pool ||= current_coordinator.pools.active.sole
  rescue ActiveRecord::RecordNotFound
    nil
  end
end
