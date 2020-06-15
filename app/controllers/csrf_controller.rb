# frozen_string_literal: true

# CSRF Controller (CWE-352)
class CsrfController < ApplicationController
  skip_forgery_protection

  def new
    @title = 'CWE-352: Cross-Site Request Forgery'
    @user = User.new
    render :new
  end

  def index
    @title = 'CWE-352: Cross-Site Request Forgery'
    @user = User.new(user_params)

    if @user.save
      @user.send_activation_email
      flash[:info] = 'Please check your email to active your account.'
      redirect_to root_url
    else
      render :new
    end
  end

  def create
    @title = 'CWE-352: Cross-Site Request Forgery'
    @user = User.new(user_params)

    if @user.save
      @user.send_activation_email
      flash[:info] = 'Please check your email to active your account.'
      redirect_to root_url
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation)
  end
end
