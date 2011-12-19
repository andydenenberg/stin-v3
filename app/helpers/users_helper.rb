module UsersHelper
  
  def roles
    roles = Array.new
    roles = [['Admin', 0],['User', 1],['Guest', 2]]
    return roles
  end
  
  def x_roles(role) # used to translate value stored into english
    x = roles
    x[role][0]
  end
  
end
