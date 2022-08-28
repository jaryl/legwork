class Manage::PoolsController < Manage::BaseController
  def index
    @pools = Pool.all
  end

  def show
    @pool = Pool.find(params[:id])
  end
end
