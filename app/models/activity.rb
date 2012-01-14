class Activity < ActiveRecord::Base
  belongs_to :org
  belongs_to :user

validates_presence_of :duration
validates_numericality_of :duration

  def self.user_time(user_id = 'All', org_id = 'All')
    @activities = user_id == 'All' && org_id == 'All' ? self.all :
    @activities = user_id == 'All' && org_id != 'All' ? self.where(:org_id => org_id ).order('starttime') :
    @activities = user_id != 'All' && org_id == 'All' ? self.where(:user_id => user_id ).order('starttime') :
    @activities = user_id != 'All' && org_id != 'All' ? self.where(:user_id => user_id, :org_id => org_id ).order('starttime')  :
    never_get_here
    
    total_hours = 0
    @activities.each do |act|
      total_hours += act.duration
    end
    return total_hours
  end
  
  def self.show_date_range ( user, organization, startdate, enddate )
    if    user == 'All' && organization == 'All' 
            @acts = Activity.all(:conditions => ["starttime >= ? AND starttime <= ?", startdate, enddate] )
    elsif user == 'All' && organization != 'All'
            @acts = Activity.all(:conditions => ["starttime >= ? AND starttime <= ? AND org_id = ?", startdate, enddate, organization] ) 
    elsif user != 'All' && organization == 'All'
            @acts = Activity.all(:conditions => ["starttime >= ? AND starttime <= ? AND user_id = ?", startdate, enddate, user] ) 
    elsif user != 'All' && organization != 'All'
            @acts = Activity.all(:conditions => ["starttime >= ? AND starttime <= ? AND user_id = ? AND org_id = ?", startdate, enddate, user, organization] ) 
    end
    return @acts
    puts @acts
  end
  
end
