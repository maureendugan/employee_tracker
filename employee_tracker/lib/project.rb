class Project < ActiveRecord::Base
  has_many(:employees, :through => :contribution)

end
