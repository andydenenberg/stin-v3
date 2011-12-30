class Donation < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :org
  
  validates_presence_of :value
  validates_numericality_of :value
  
end
