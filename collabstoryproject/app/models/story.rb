class Story < ActiveRecord::Base
	has_many :nodes
	has_many :links
	belongs_to :user

	accepts_nested_attributes_for :nodes, :reject_if => lambda { |a| a[:content].blank? }
end
