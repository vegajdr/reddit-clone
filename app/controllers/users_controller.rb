class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: [:destroy]
end
