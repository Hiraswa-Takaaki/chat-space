class UsersController < ApplicationController
  def index
    def index
      # @users = User.search(params[:keyword], current_user.id)
      @users =  User.where('name Like(?)',"%#{params[:keyword]}%").where.not(id: params[:userid])
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  def edit
    @users = User.where.not(id: current_user)
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end