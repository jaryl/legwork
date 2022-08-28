class Coordinate::PoolsController < Coordinate::BaseController
  before_action :redirect_if_no_active_pool, only: [:show, :destroy]
  before_action :redirect_if_active_pool_present, only: [:new, :create]

  def show
    @pool = current_coordinator.active_pool
  end

  def new
    @pool = current_coordinator.pools.build
  end

  def create
    @pool = current_coordinator.pools.build(pool_params)
    if @pool.save
      redirect_to coordinate_pool_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @pool = current_coordinator.active_pool
    # TODO: replace with flag, instead of deleting record
    @pool.destroy!
    redirect_to new_coordinate_pool_path, status: :see_other
  end

  private

  def redirect_if_no_active_pool
    return if current_coordinator.active_pool.present?
    redirect_to new_coordinate_pool_path, status: :see_other
  end

  def redirect_if_active_pool_present
    return unless current_coordinator.active_pool.present?
    redirect_to coordinate_pool_path, status: :see_other
  end

  def pool_params
    params.require(:pool)
      .permit(:name)
      .with_defaults(handler: current_coordinator, scheme_class: "Manual")
  end
end
