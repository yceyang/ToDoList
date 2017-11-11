class List < ApplicationRecord

  def update_status
    today = Date.today
    
    datediff = (self.due_date - today).to_i 
    if self.task_done
      self.status = 1 # done
    else        
      if datediff < 0
        self.status = 3 # overdue
      elsif datediff >= 0 && datediff <= 3
        self.status = 2 # nearly overdue
      else
        self.status = 0 # planning
      end
    end
  end

end
