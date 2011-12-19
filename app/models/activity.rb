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


end
