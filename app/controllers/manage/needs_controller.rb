class Manage::NeedsController < Manage::BaseController
  before_action :prepare_beneficiary
  before_action :prepare_need, only: [:edit, :update]

  def new
    @need = @beneficiary.needs.new
  end

  def create
    @need = @beneficiary.needs.new(create_need_params)
    if @need.save
      redirect_to [:manage, @beneficiary], status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @need.update(update_need_params)
      redirect_to [:manage, @beneficiary], status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def prepare_beneficiary
    @beneficiary = Beneficiary.find(params[:beneficiary_id])
  end

  def prepare_need
    @need = @beneficiary.needs.find(params[:id])
  end

  def create_need_params
    params.require(:need)
      .permit(:label_id, :description)
      .with_defaults(manager: current_manager, status: :draft)
  end

  def update_need_params
    params.require(:need).permit(:status, :label_id, :description)
  end
end
