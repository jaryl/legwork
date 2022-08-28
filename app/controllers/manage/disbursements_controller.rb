class Manage::DisbursementsController < Manage::BaseController
  before_action :prepare_pool

  def new
    @disbursement = @pool.transaction_records.disbursements.build
  end

  def create
    @disbursement = @pool.transaction_records.disbursements.build(disbursement_params)
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
      .permit(:value)
      .with_defaults(transactable: current_need.disbursements.build)
  end

  def current_need
    # TODO: replace with actual implementation
    @current_need ||= Need.first
  end
end
