class Manage::DisbursementsController < Manage::BaseController
  before_action :prepare_pool

  def new
    @disbursement = Disbursement.new { |disbursement| disbursement.build_transaction_record(pool: @pool) }
  end

  def create
    @disbursement = Disbursement.new { |disbursement| disbursement.build_transaction_record(pool: @pool) }
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
    params.require(:disbursement).permit(:need_id, transaction_record_attributes: [:value])
  end
end
