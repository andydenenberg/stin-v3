class ActivitiesController < ApplicationController

  def sorted
      user = params[:user]
      organization = params[:org]

      @activities = user == 'All' && organization == 'All' ? Activity.all :
      @activities = user == 'All' && organization != 'All' ? Activity.where(:org_id => organization ).order('starttime') :
      @activities = user != 'All' && organization == 'All' ? Activity.where(:user_id => user ).order('starttime') :
      @activities = user != 'All' && organization != 'All' ? Activity.where(:user_id => user, :org_id => organization ).order('starttime')  :
      never_get_here
                                    
      @user_time = Activity.user_time(user, organization)
      @orgs = Org.all
      @users = User.all
      render :partial => 'index', :layout => false

  end

  # GET /activities
  # GET /activities.json
  def index
#    @activities = Activity.all
    @activities = Activity.paginate(:page => params[:page], :per_page => 3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    @activity = Activity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render json: @activity, status: :created, location: @activity }
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :ok }
    end
  end
end
