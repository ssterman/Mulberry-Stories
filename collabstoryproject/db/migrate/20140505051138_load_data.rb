class LoadData < ActiveRecord::Migration
  def up
  	down

  	us = User.new(:username => "Tester1")
  	us2 = User.new(:username => "Tester2")


  	ts1 = Story.new(:summary => "Stories about football, from spectators, players, fans, etc.", :title => "Football at Stanford")
  	ts1.user = us
  	ts1.save(:validate => false)

  	ts2 = Story.new(:summary => "A traditional folktale about two children abandoned in a forest and a very hungry cannibal witch", :title => "Hansel and Gretel")
  	ts2.user = us2
  	ts2.save(:validate => false)

    n1 = Node.new(:text => "When freshmen arrive at Stanford, the very first football game of the season is 
      a big deal.  The dorms take all their students, with chanting and dorm flags, to go see the game.")
  	n1.user = us
  	n1.truth = true
  	n1.truth_height = 0
  	n1.story = ts1
  	n1.save(:validate => false)

    n2 = Node.new(:text => "That was one of three games I went to.  I sat with some of the people who knew
      about football.  They narrated the game to me, and even though I had no idea what was going on, the thrill
      of an entire crowd responding around me was infectious.")
    n2.story = ts1
  	n2.user = us
  	n2.truth = false
  	n2.save(:validate => false)

  	n3 = Node.new(:text => "Brad and six other guys painted their whole chests.  He had a big red cape as well.  
      That was the start of a long history of more and more epic football costumes. He ended up in a couple of news
      articles as the 'picture of Stanford fans', since he was the craziest dressed of anybody there.  Except the
      band.  Not many people can beat the band.")
    n3.user = us
  	n3.truth = false
  	n3.story = ts1
  	n3.save(:validate => false)

    n10 = Node.new(:text => "The other big football event is Big Game, where Cal and Stanford face off in the
      yearly skirmish for the Axe, and the upper hand in an eternal rivalry.")
    n10.user = us
    n10.truth = true
    n10.story = ts1
    n10.truth_height = 1
    n10.save(:validate => false)


  	n4 = Node.new(:text => "Hansel and Gretel are abandoned in the forest. They are lost, and their trail home has been eaten.")
  	n4.user = us2
  	n4.story = ts2
  	n4.truth = true
  	n4.truth_height = 0
  	n4.save(:validate => false)

  	n5 = Node.new(:text => "The two siblings explore the forest.")
  	n5.user = us2
  	n5.story = ts2
  	n5.truth = false
  	n5.save(:validate => false)

  	n6 = Node.new(:text => "They run into a bear and nearly get eaten.")
  	n6.user = us2
  	n6.story = ts2
  	n6.truth = false
  	n6.save(:validate => false)

  	n7 = Node.new(:text => "They end up at a house made of candy")
  	n7.user = us2
  	n7.story = ts2
  	n7.truth = false
  	n7.save(:validate => false)

  	n8 = Node.new(:text => "Hansel is very scared and sits down to cry")
  	n8.user = us2
  	n8.story = ts2
  	n8.truth = false
  	n8.save(:validate => false)

  	n9 = Node.new(:text => "The witch locks them up and tries to eat them.")
  	n9.user = us2
  	n9.story = ts2
  	n9.truth = true
  	n9.truth_height = 1
  	n9.save(:validate => false)

    l1 = Link.new(:story_id => 1,:source => 1, :target => 2)
    l1.save(:validate => false)

    l2 = Link.new(:story_id => 1, :source => 1, :target => 3)
    l2.save(:validate => false)

    l3 = Link.new(:story_id => 2, :source => 4, :target => 5)
    l3.save(:validate => false)

    l4 = Link.new(:story_id => 2, :source => 5, :target => 6)
    l4.save(:validate => false)

    l5 = Link.new(:story_id => 2, :source => 5, :target => 6)
    l5.save(:validate => false)

    l6 = Link.new(:story_id => 2, :source => 8, :target => 7)
    l6.save(:validate => false)

    l7 = Link.new(:story_id => 2, :source => 6, :target => 8)
    l7.save(:validate => false)

    l8 = Link.new(:story_id => 2, :source => 7, :target => 9)
    l8.save(:validate => false)

    l9 = Link.new(:story_id => 2, :source => 4, :target => 8)
    l9.save(:validate => false)

  end

  def down
  	Story.delete_all
  	Node.delete_all
  end
end
