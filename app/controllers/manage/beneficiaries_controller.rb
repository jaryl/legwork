class Manage::BeneficiariesController < Manage::BaseController
  def index
    @beneficiaries = Beneficiary.all
  end

  def show
    @beneficiary = Beneficiary.find(params[:id])
  end

  def new
    @beneficiary = Beneficiary.new
  end

  def create
    @beneficiary = Beneficiary.new(beneficiary_params)
    if @beneficiary.save
      redirect_to manage_beneficiaries_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @beneficiary = Beneficiary.find(params[:id])
  end

  def update
    @beneficiary = Beneficiary.find(params[:id])
    if @beneficiary.update(beneficiary_params)
      redirect_to [:manage, @beneficiary], status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def beneficiary_params
    params.require(:beneficiary).permit(:full_name, :gender, :contact_number, :email, :address)
  end
end
