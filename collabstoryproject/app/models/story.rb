class Story < ActiveRecord::Base
	has_many :nodes
	belongs_to :user
end
