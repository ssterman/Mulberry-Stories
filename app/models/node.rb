class Node < ActiveRecord::Base
	belongs_to :story
	belongs_to :user
	has_one :constraint
end
