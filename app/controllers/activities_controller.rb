class ActivitiesController < ApplicationController

  def sorted
      user = params[:user]
      organization = params[:org]
      ranges = show_time_window(params[:timeframe])
      startdate = ranges[0]
      enddate = ranges[1]
      @activities = Activity.show_date_range( user, organization , startdate, enddate )

#      @user_time = Activity.user_time(user, organization)
#      @orgs = Org.all
#      @users = User.all
           
      render :partial => 'index', :layout => false

  end

  # GET /activities
  # GET /activities.json
  def index
#    @activities = Activity.all
      ranges = show_time_window('3') # the index value needs to be manually synced with the index.html - selector
      startdate = ranges[0]
      enddate = ranges[1]
      @activities = Activity.show_date_range( 'All', 'All' , startdate, enddate )

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
    @activity.starttime = Time.now.strftime( '%Y-%m-%d' ) 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])  
    @activity.starttime = @activity.starttime.strftime( '%Y-%m-%d' )  
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(params[:activity])

    if @activity.worker1 != nil
      @worker1 = Activity.new(params[:activity])
      @worker1.user_id = @worker1.worker1
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
  
  
  def show_time_window ( timeframe )
    if timeframe == '0' # All dates
      startdate = '2000-01-01'
      enddate = Date.tomorrow.to_s
    elsif timeframe == '1' # Current Month
      startdate = Date.today.beginning_of_month.to_s
      enddate = Date.today.end_of_month.to_s
    elsif timeframe == '2' # Last Month
      startdate = Date.today.prev_month.year.to_s + '-' + Date.today.prev_month.month.to_s + '-' + '01'
      enddate = Date.civil(Date.today.prev_month.year, Date.today.prev_month.month, -1 ).to_s
    elsif timeframe == '3' # Current Year
      startdate = Date.today.year.to_s + '-01-01'
      enddate = Date.today.year.to_s + '-12-31'
    elsif timeframe == '4' # Last Year
      startdate = Date.today.prev_year.year.to_s + '-01-01'
      enddate = Date.today.prev_year.year.to_s + '-12-31'
    end
    time_window = [startdate, enddate ]
    return time_window
  end
  
  
  
end
