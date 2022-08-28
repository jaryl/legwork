class Manage::DonorsController < ApplicationController
  def index
    @donors = Donor.all
  end

  def show
    @donor = Donor.find(params[:id])
  end
end
