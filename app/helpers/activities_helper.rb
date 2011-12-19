module ActivitiesHelper

  def organization_name(org_id)
    name = Org.find(:all, :conditions => { :id  => org_id  }).first.organization
  end

#  def user_time(user_id)
#    acts = Activity.find(:all, :conditions => { :user_id  => user_id })
#    total_hours = 0
#    acts.each do |act|
#      total_hours += ( act.endtime - act.starttime )/3600
#    end
#    return total_hours
#  end
      
  def total_activities
    total_activities = Activity.all.count
  end

  def total_time
    activities = Activity.all
    total_hours = 0
    activities.each do |act|
      total_hours += act.duration
    end
    return total_hours
  end

  def total_activity_time(org_id)
    if org_id == "all"
      activities = Activity.all
   else
     activities = Activity.find(:all, :conditions => { :org_id  => org_id })
   end
   total_hours = 0
   activities.each do |act|
     total_hours += act.duration
   end

    return total_hours
  end

  def impact_choices
    impact = Array.new
    impact = [['Not', 0],['Slightly', 1],['Somewhat', 2],['Very', 3],['Extremely', 4]]
    return impact
  end

  def x_impact(impact) # used to translate value stored into english
    x = impact_choices
    x[impact][0]
  end
  
  def time_frames
    time_frame = Array.new
    time_frame = [['All' , 0], ['Current Month' , 1], ['Last Month', 2], ['Current Year', 3]]
    return time_frame
  end
  
  def reward_choices
    reward = Array.new
    reward = [["Like Mick Jagger", 0 ],["Not worthwhile" , 1 ],["Was OK", 2 ],["Great Feeling", 3], ["Unforgettable", 4 ]]
	  return reward
	end
	
	def x_reward(reward)
	  r = reward_choices
	  r[reward][0]
	end
    
  def users_for_activities
    @user = Array.new
    @user = [ ' ' ]
    @user += User.all.collect { |u| [u.username, u.id] }
    return @user
  end

  def users_for_select
    @user = Array.new
    @user = [ 'All' ]
    @user += User.all.collect { |u| [u.username, u.id] }
    return @user
  end

  def orgs_for_select # this is used for display purposes
    @org = [ 'All']
    @org += Org.all.collect { |o| [o.organization, o.id] } 
    return @org
  end
  
  def orgs_for_form	
      @org = [ ]
      @org += Org.all.collect { |o| [o.organization, o.id] } 
      return @org
    end
    	
end
