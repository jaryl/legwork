class ContactMethod
  include ActiveModel::Model

  attr_accessor :type, :value

  validates :type, :value, presence: true
end
