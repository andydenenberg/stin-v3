module DonationsHelper
  
  def donation_kind
    kind = Array.new
    kind = [['Financial($)', 0],['Clothing', 1],['Furniture', 2],['Electronics', 3],['Other', 4]]
    return kind
  end
 
  def x_donation_kind(kind) # used to translate value stored into english
    x = donation_kind
    x[kind][0]
  end
  
end
