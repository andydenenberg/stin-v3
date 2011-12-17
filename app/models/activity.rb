class Activity < ActiveRecord::Base
  belongs_to :org
  belongs_to :user

  def self.user_time(user_id = 'All', org_id = 'All')
    @activities = user_id == 'All' && org_id == 'All' ? self.all :
    @activities = user_id == 'All' && org_id != 'All' ? self.where(:org_id => org_id ).order('starttime') :
    @activities = user_id != 'All' && org_id == 'All' ? self.where(:user_id => user_id ).order('starttime') :
    @activities = user_id != 'All' && org_id != 'All' ? self.where(:user_id => user_id, :org_id => org_id ).order('starttime')  :
    never_get_here
    
    total_hours = 0
    @activities.each do |act|
      total_hours += ( act.endtime - act.starttime )/3600
    end
    return total_hours
  end


end
