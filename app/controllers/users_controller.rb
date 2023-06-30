class UsersController < ApplicationController
  def new
  end

  def success
    # This action doesn't require any specific logic
  end

  def create
    # Create a new user with the provided email and password
    # Replace this code with your actual user creation logic
    user = User.create(email: params[:email], password: params[:password])

    if user.valid?
      redirect_to login_path, notice: 'New user created. Please log in.'
    else
      flash[:alert] = 'Failed to create user. Please try again.'
      redirect_to root_path
    end
  end

  def login
    email = params[:email]
    password = params[:password]

    # Check if email and password are present
    if email.blank? || password.blank?
      flash[:alert] = 'Please enter both email and password.'
      redirect_to login_path
      return
    end

    # Find the user with the given email
    user = User.find_by(email: email)

    if user.nil? || !user.authenticate(password)
      flash[:alert] = 'Incorrect details, please try again.'
      redirect_to login_path
    else
      flash[:notice] = 'Login successful'
      redirect_to success_path
    end
  end

  def success
  end
end
