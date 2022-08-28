class Manage::UpdatesController < Manage::BaseController
  before_action :prepare_campaign
  before_action :prepare_update, only: [:edit, :update, :destroy]

  def new
    @update = @campaign.updates.build
  end

  def create
    @update = @campaign.updates.build(create_update_params)
    if @update.save
      redirect_to [:manage, @campaign], status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @update.update(update_update_params)
      redirect_to [:manage, @campaign], status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @update.destroy!
    redirect_to [:manage, @campaign], status: :see_other
  end

  private

  def prepare_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def prepare_update
    @update = @campaign.updates.find(params[:id])
  end

  def create_update_params
    params.require(:update).permit(:body).with_defaults(manager: current_manager)
  end

  def update_update_params
    params.require(:update).permit(:body)
  end
end
