class List < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user

  has_many :listEntries
  has_many :movies, :through => :listEntries

end
