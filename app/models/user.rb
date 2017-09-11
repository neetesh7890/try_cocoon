class User < ActiveRecord::Base

  
  has_one :user_detail, dependent: :destroy, :autosave => true

  accepts_nested_attributes_for :user_detail

end
