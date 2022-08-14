class Role < ActiveRecord::Base
  has_many :auditions

  def auditions
    Audition.where(role_id: self.id)
  end
  def actors
    Audition.where(role_id: self.id).pluck(:actor)
  end
  def locations
    Audition.where(role_id: self.id).pluck(:location)
  end
  def lead
    if(Audition.where(role_id: self.id).where(hired: true).exists?)
        Audition.where(role_id: self.id).where(hired: true)
    else
        puts 'no actor has been hired for this role'
    end
  end

  def understudy
    if (self.lead.second)
        self.lead.second
    else 
        puts 'no actor has been hired for understudy for this role'
    end
  end



end