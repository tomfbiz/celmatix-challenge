module API
  # Verifies user is authenticated as admin before the +index+ action is run
  class UsersController < ApplicationController
    before_action only: :index do
      authenticate_user_api!(require: :admin)
    end

    # Renders all +user+ records as JSON
    def index
      @users = User.all
      render formats: :json
    end
  end
end
