class UsersController < ApplicationController

    def show
       user = User.find_by(id: params[:id])
       render json: user, include: [:ingredients => {except: [:created_at, :updated_at]}, :recipes => {except: [:created_at, :updated_at]}], except: [:created_at, :updated_at] 
    end

    def create
        # user = user.create(user_params)
        # if user.valid?
        #     redirect_to `users/#{user.id}`
        # else
        #     flash[:messages]
        # end
    end
end