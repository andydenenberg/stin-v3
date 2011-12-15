module UsersHelper
  
  def roles
    roles = Array.new
    roles = [['Admin', 0],['User', 1],['Guest', 2]]
    return roles
  end
  
  
end
