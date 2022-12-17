class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Осуществить вход пользователя и перенаправление на страницу профиля.
    else
      # Выдать сообщение об ошибке.
      render 'new'
    end
  end
end