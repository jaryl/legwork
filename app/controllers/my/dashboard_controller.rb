class My::DashboardController < ApplicationController
  def show
    # TODO: add support for admins
    # redirect_to admin_root_path if current_admin.present?

    if current_manager.present?
      redirect_to manage_root_path
    elsif current_coordinator.present?
      redirect_to coordinate_root_path
    end
  end
end
