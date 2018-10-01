class UsersController < Clearance::UsersController
  def index
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
    render "users/edit"
  end

  def new
  end

  def create
    
    # dob_month = params['month']
    # dob_day = params['day']
    # dob_year = params['year']
    # dob = Date.parse(dob_month + " " + dob_day + " " + dob_year)
    # user = User.new(email: params['email'], first_name: params['first_name'], last_name: params['last_name'], password: params['password'], birthday: dob)
    # user.save
    # sign_in user
    # redirect_to users_path

    @user = User.new(user_params)    

    if @user.save
      redirect_to root_path
    else
      return false
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)   

  end

  def destroy
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :birthday, :profile_photo)
  end
end
