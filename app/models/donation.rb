class Donation < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :org
  
  validates_presence_of :value
  validates_numericality_of :value
  
  
  def self.total_donations(user_id = 'All', org_id = 'All')
    @donations = user_id == 'All' && org_id == 'All' ? self.all :
    @donations = user_id == 'All' && org_id != 'All' ? self.where(:org_id => org_id ) :
    @donations = user_id != 'All' && org_id == 'All' ? self.where(:user_id => user_id ) :
    @donations = user_id != 'All' && org_id != 'All' ? self.where(:user_id => user_id, :org_id => org_id )  :
    never_get_here
    
    total_value = 0
    @donations.each do |donate|
      total_value += donate.value
    end
    return total_value
  end
  
  
  
end
