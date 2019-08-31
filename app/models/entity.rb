class Entity < ApplicationRecord

  has_many :sales
  has_many :payments

  validates_presence_of  :name
  validates_length_of :name,    :within => 5..50
  validates_length_of :mobile,    :is => 10, :allow_blank => true
  validates_format_of :mobile, :with => /\A[0-9]+\Z/, :message => " : Please enter correct mobile No", :allow_blank => true

  def get_entity_name_for_select_options
    "#{name} (#{mobile})"
  end
  
end
