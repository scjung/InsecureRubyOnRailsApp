# frozen_string_literal: true

# Controller for insecure users
class InsecureUsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy
                                          following followers]
  before_action :correct_user, only: %i[edit update]
  before_action :set_user, only: %i[show edit update destroy]
  before_action :admin_user, only: %i[destroy]

  def new
    @user = InsecureUser.new
  end

  def create
    @user = InsecureUser.new(user_params)

    if @user.save
      flash[:info] = 'The user account is created.'
      @user.activate
      log_in @user
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:insecure_user).permit(:name, :email,
                                          :password, :password_confirmation)
  end
end
