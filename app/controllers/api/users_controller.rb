module API
  class UsersController < ApplicationController
    before_action only: :index do
      authenticate_user_api!(require: :admin)
    end

    def index
      @users = User.all
      render formats: :json
    end
  end
end
