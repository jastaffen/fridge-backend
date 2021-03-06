class Api::V1::UsersController < ApplicationController

    skip_before_action :authorized, only: [:index, :show, :create]

    def index
        users = User.all

        render json: {users: users}
    end

    def show
        user = User.find_by(id: params[:id])
        render json: { user: UserSerializer.new(user) }, status: :accepted
    end

    def create
        user = User.create(user_params)
        if user.valid?
            token = encode_token(user_id: user.id)
            render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
            render json: { error: "Failed to create user" }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :password_digest)
    end
end