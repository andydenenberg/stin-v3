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
    @activities = Activity.all

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
    @activity.starttime = Time.now.to_formatted_s(:short)

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

    if @activity.worker1 != nil
      @worker1 = Activity.new(params[:activity])
      @worker1.user_id = @worker1.worker1
      puts ' '
      puts ' '
      puts 'shfkjhsakjfhdkjhfaksdhfkahfkgasdhjkfgjasgdfhjgs'
      puts @activity.worker1      
      puts @worker1.user_id
      @worker1.save
    end
    
    if @activity.worker2 != nil
      @worker2 = Activity.new(params[:activity])
      @worker2.user_id = @worker2.worker2
      @worker2.save
    end
    
    if @activity.worker3 != nil
      @worker3 = Activity.new(params[:activity])
      @worker3.user_id = @worker3.worker3
      @worker3.save
    end
    
    if @activity.worker4 != nil
      @worker4 = Activity.new(params[:activity])
      @worker4.user_id = @worker4.worker4
      @worker4.save
    end
    if @activity.worker5 != nil
      @worker5 = Activity.new(params[:activity])
      @worker5.user_id = @worker5.worker5
      @worker5.save
    end
    
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
