class UsersController < Clearance::UsersController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
    
    dob_month = params['month']
    dob_day = params['day']
    dob_year = params['year']
    dob = Date.parse(dob_month + " " + dob_day + " " + dob_year)
    user = User.new(email: params['email'], first_name: params['first_name'], last_name: params['last_name'], password: params['password'], birthday: dob)
    user.save
    sign_in user
    redirect_to users_path
  end

  def update
  end

  def destroy
  end
end
