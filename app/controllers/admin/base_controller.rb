class Admin::BaseController < ApplicationController
  before_action :authorise_current_admin!
end
