class Manage::BaseController < ApplicationController
  private

  def current_manager
    # TODO: replace with working implementation
    @current_manager ||= Manager.first || FactoryBot.create(:manager)
  end
end
