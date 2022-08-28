class Manage::DisbursementsController < Manage::BaseController
  before_action :prepare_pool

  def new
    @disbursement = Disbursement.new(transaction_record: @pool.transaction_records.build)
  end

  def create
    @disbursement = Disbursement.new(transaction_record: @pool.transaction_records.build)
    @disbursement = Disbursement.new(transaction_record: @pool.transaction_records.build)
    @disbursement.attributes = disbursement_params
    if @disbursement.save
      redirect_to [:manage, @pool], status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def prepare_pool
    @pool = Pool.find(params[:pool_id])
  end

  def disbursement_params
    params.require(:disbursement)
      .permit(transaction_record_attributes: [:value])
      .with_defaults(need: current_need)
  end

  def current_need
    # TODO: replace with actual implementation
    @current_need ||= Need.first
  end
end
