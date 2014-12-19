class AddStartNodesForSeedStories < ActiveRecord::Migration
  def change
  	s1 = Story.find(1)
  	s1.start_node_id = 1
  	s1.save

  	s2 = Story.find(2)
  	s2.start_node_id = 2
  	s2.save

  	s3 = Story.find(3)
  	s3.start_node_id = 3
  	s3.save

  	s4 = Story.find(4)
  	s4.start_node_id = 4
  	s4.save

  	s5 = Story.find(5)
  	s5.start_node_id = 5
  	s5.save

  	s6 = Story.find(6)
  	s6.start_node_id = 6
  	s6.save

  	s7 = Story.find(7)
  	s7.start_node_id = 7
  	s7.save

  	s8 = Story.find(8)
  	s8.start_node_id = 8
  	s8.save

  	s9 = Story.find(9)
  	s9.start_node_id = 9
  	s9.save

  	s10 = Story.find(10)
  	s10.start_node_id = 10
  	s10.save

  	s11 = Story.find(11)
  	s11.start_node_id = 17
  	s11.save

  	s12 = Story.find(12)
  	s12.start_node_id = 18
  	s12.save

  end
end
