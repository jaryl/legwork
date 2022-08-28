class Manage::DonorsController < Manage::BaseController
  def index
    @donors = Donor.all
  end

  def show
    @donor = Donor.find(params[:id])
  end
end
