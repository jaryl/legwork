class Coordinate::ProfilesController < Coordinate::BaseController
  skip_before_action :authorise_current_coordinator!, only: [:new, :create]

  before_action :redirect_if_profile_already_exists, only: [:new, :create]
  before_action :prepare_profile, only: [:show, :edit, :update]

  def show
  end

  def new
    @profile = Coordinator.new
  end

  def create
    @profile = Coordinator.new(profile_params) do |coordinator|
      coordinator.profile.account = current_account
    end

    if @profile.save
      redirect_to coordinate_profile_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @profile.attributes = profile_params
    if @profile.save
      redirect_to coordinate_profile_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def redirect_if_profile_already_exists
    redirect_to coordinate_profile_path, status: :see_other if current_coordinator.present?
  end

  def profile_params
    params.require(:coordinator).permit(
      contact_methods: [:type, :value],
      profile_attributes: [:display_name],
    )
  end

  def prepare_profile
    @profile = current_coordinator
  end
end
