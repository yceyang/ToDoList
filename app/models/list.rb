class List < ApplicationRecord
  validates_presence_of :item_name, :due_date, :memo

  def update_status
    today = Date.today #Date.parse("2017-11-12") 

    datediff = (self.due_date - today)
    if self.task_done
      self.update(status: 1) # done
    else        
      if datediff < 0
        self.update(status: 3) # overdue
      elsif datediff >= 0 && datediff <= 3
        self.update(status: 2) # nearly overdue
      else
        self.update(status: 0) # planning
      end
    end
  end
end
