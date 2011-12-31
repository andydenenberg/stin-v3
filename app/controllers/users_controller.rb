class UsersController < ApplicationController

  # GET /users
    # GET /users.json
    def index
      @users = User.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @users }
      end
    end

    # GET /users/1/edit
    def edit
      @user = User.find(params[:id])
    end

    def show
      @user = User.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @user }
      end
    end

   def new
      @user = User.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @user }
      end
    end

#   def new
#     if User.count > 0
#     flash[:info] = 'Registrations are not open yet, but please check back soon'
#     redirect_to home_index_path
#     @skip_registration = true
#     else
#       @skip_registration = false
#       super
#     end    
#   end

    def create
      @user = User.new(params[:user])

      Notifier.signup_email(@user).deliver


      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, :notice => 'User was successfully created.' }
          format.json { render :json => @user, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          format.json { render :json => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
    
#  def create
#    if User.count > 0
#    flash[:info] = 'Registrations are not open yet, but please check back soon'
#    redirect_to home_index_path
#    else 
#      super
#    end
#  end
 
        
    def update
      @user = User.find(params[:id])
      
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end

      respond_to do |format|
        if @user.update_attributes(params[:user])
          format.html { redirect_to @user, :notice => 'User was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @user.errors, :status => :unprocessable_entity }
        end
      end
    end


end
