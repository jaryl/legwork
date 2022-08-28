class Manage::CampaignsController < Manage::BaseController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(create_campaign_params)
    if @campaign.save
      redirect_to [:manage, @campaign], status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(update_campaign_params)
      redirect_to [:manage, @campaign], status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def create_campaign_params
    params.require(:campaign)
      .permit(:need_id, :pool_id, :description, :start_date, :end_date, :funding_goal)
      .with_defaults(manager: current_manager)
  end

  def update_campaign_params
    params.require(:campaign).permit(:description, :start_date, :end_date, :funding_goal)
  end
end
