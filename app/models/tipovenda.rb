class Tipovenda < ActiveRecord::Base
  has_many :vendaplanos, dependent: :restrict_with_exception
end
