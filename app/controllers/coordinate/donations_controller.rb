class Coordinate::DonationsController < Coordinate::BaseController
  before_action :redirect_if_no_active_pool
  before_action :prepare_new_donation, only: [:new, :create]

  def index
    @donations = current_pool.transaction_records.donations.map(&:transactable)
  end

  def show
    @donation = current_pool.transaction_records.donations.find_by!(transactable_id: params[:id]).transactable
  end

  def new
  end

  def create
    @donation.attributes = donation_params

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

  def prepare_new_donation
    @donation = Donation.new do |donation|
      donation.build_transaction_record(pool: current_pool)
      donation.build_donor
    end
  end

  def donation_params
    params.require(:donation).permit(
      donor_attributes: [:name, :contact_number],
      transaction_record_attributes: [:value]
    )
  end
end
