class Property < ActiveRecord::Base

  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true

end
