class Manage::BaseController < ApplicationController
  before_action :authorise_current_manager!
end
