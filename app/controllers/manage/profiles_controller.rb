class Manage::ProfilesController < Manage::BaseController
  skip_before_action :authorise_current_manager!, only: [:new, :create]

  before_action :redirect_if_profile_already_exists, only: [:new, :create]

  def show
    @profile = current_manager
  end

  def new
    # TODO: check if there is an existing invite
    @profile = Manager.new
  end

  def create
    @profile = Manager.new(profile_params)
    @profile.profile.account = current_account

    if @profile.save
      redirect_to manage_profile_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = current_manager
  end

  def update
    @profile = current_manager
    if @profile.update(profile_params)
      redirect_to manage_profile_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def redirect_if_profile_already_exists
    redirect_to manage_profile_path, status: :see_other if current_manager.present?
  end

  def profile_params
    params.require(:manager).permit(
      :contact_number,
      profile_attributes: [:display_name],
    )
  end
end
