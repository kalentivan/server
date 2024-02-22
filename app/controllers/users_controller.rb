class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили форму регистрации'
      render :new
    end
  end

  def edit
    if params[:id] == session[:user_id] 
      @user = User.find(params[:id])
    else 
      redirect_to root_path
    end
  end

  def update
    if params[:id] == session[:user_id] 
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to root_path, notice: 'Данные успешно изменены!'
      else
        flash.now[:alert] = 'Вы неправильно заполнили форму регистрации'
        render :edit
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    session.delete(:user_id)
    
    redirect_to root_path notice: 'Пользователь удален!'
  end

  private
  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password
    )
  end
end
