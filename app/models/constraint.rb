class Constraint < ActiveRecord::Base
	belongs_to :story
	belongs_to :node
end
