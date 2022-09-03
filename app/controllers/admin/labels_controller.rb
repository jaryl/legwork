class Admin::LabelsController < Admin::BaseController
  def index
    @labels = Label.all
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to [:admin, :labels], status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @label = Label.find(params[:id])
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(label_params)
      redirect_to [:admin, :labels], status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy!
    redirect_to [:admin, :labels], status: :see_other
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end
end
