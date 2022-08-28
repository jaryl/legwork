class Coordinate::DonationsController < Coordinate::BaseController
  before_action :redirect_if_no_active_pool

  def index
    @donations = current_pool.transaction_records.donations.all.map
  end

  def show
    @donation = current_pool.transaction_records.donations.find(params[:id])
  end

  def new
    @donation = current_pool.transaction_records.donations.build
  end

  def create
    @donation = current_pool.transaction_records.donations.build(donation_params)
    if @donation.save
      redirect_to coordinate_donation_path(@donation), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def redirect_if_no_active_pool
    return if current_pool.present?
    redirect_to new_coordinate_pool_path, status: :see_other
  end

  def donation_params
    params.require(:donation)
      .permit(:value)
      .with_defaults(transactable: Donation.new)
  end
end
