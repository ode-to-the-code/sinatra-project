class Rider < ActiveRecord::Base
  has_secure_password
  has_many :autopods 


end
