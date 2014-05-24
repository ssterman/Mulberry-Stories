class LoadData < ActiveRecord::Migration
  def up
  	down

  	us = User.new(:username => "Tester1", :password => "abcd", :first_name => "a", :last_name => "b")
  	us2 = User.new(:username => "Tester2", :password => "efgh", :first_name => "c", :last_name => "d")
    us3 = User.new(:username => "skipper", :password => "pickles", :first_name => "Jess", :last_name => "L")
    us3.save

  	ts1 = Story.new(:summary => "Stories about football, from spectators, players, fans, etc.", :title => "Football at Stanford")
  	ts1.user = us
    ts1.genre = "nonfiction";
  	ts1.save(:validate => false)

  	ts2 = Story.new(:summary => "A Harry Potter Spinoff", :title => "The Ron/Hermione Question")
  	ts2.user = us2
    ts2.genre = "fiction";
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


  	n4 = Node.new(:text => "\"Who wouldn't prefer him, what woman would take you, you are nothing, nothing, nothing to him,\" crooned 
      Riddle-Hermione, and she stretched like a snake and entwined herself around Riddle-Harry, wrapping him in a 
      close embrace: Their lips met.")
  	n4.user = us2
  	n4.story = ts2
  	n4.truth = true
    n4.constraint_num = 1
  	n4.truth_height = 0
  	n4.save(:validate => false)

  	n5 = Node.new(:text => "\"Do it, Ron!\" Harry yelled. Ron looked toward him, and Harry thought he saw a trace of scarlet in his eyes.")
  	n5.user = us2
  	n5.story = ts2
  	n5.truth = false
    n5.constraint_num = 1
  	n5.save(:validate => false)

  	n6 = Node.new(:text => "Ron turned on them, sword in hand, and Harry saw nothing but the scarlet in Ron's eyes. Harry whirled around, slipping in the snow,
        wand held ready to defend himself, but Ron was so angry, his eyes fixed on his friends' heads.")
  	n6.user = us2
  	n6.story = ts2
  	n6.truth = false
    n6.constraint_num = 1
  	n6.save(:validate => false)

  	n7 = Node.new(:text => "Slowly, Harry walked back to him, hardly knowing what to say or do. Ron was breathing heavily: His eyes were no longer red at all, but their normal blue: they were also wet.")
  	n7.user = us2
  	n7.story = ts2
  	n7.truth = false
    n7.constraint_num = 2
  	n7.save(:validate => false)

  	n8 = Node.new(:text => "On the ground in front of them, Ron's face filled with anguish. he raised the sword high, his arms shaking.
      The sword flashed, plunged: Harry threw himself out of the way, there as a clang of metal and a long, drawn-out scream.

     The monstrous versions of himself and Hermione were gone: There was only Ron, standing there with the sword held slackly 
      in his hand, looking down at the shattered remains of the locket on the flat rock.")
  	n8.user = us2
  	n8.story = ts2
  	n8.truth = true
    n8.constraint_num = 2
  	n8.save(:validate => false)

  	n9 = Node.new(:text => "\"She's like my sister,\" Harry started. \"I love her like a sister and I reckon that she feels the same way about me. It's always been like that. I thought you knew.\"")
  	n9.user = us2
  	n9.story = ts2
  	n9.truth = false
    n9.constraint_num = 2
  	n9.truth_height = 1
  	n9.save(:validate => false)

    n11 = Node.new(:text => "\"I'm...sorry,\" Harry started in a thick voice. \"I didn't want you to find out like that. We didn't know how to tell you. Hermione...Hermione didn't want-\"")
    n11.user = us2
    n11.story = ts2
    n11.truth = false
    n11.constraint_num = 2
    n11.truth_height = 1
    n11.save(:validate => false)

    n12 = Node.new(:text =>"Simultaneously they walked forward and hugged, Harry gingerly gripping the still-sopping back of Ron's jacket.")
    n12.user = us2
    n12.story = ts2
    n12.truth = true
    n12.truth_height = 1
    n12.save(:validate => false)

    l1 = Link.new(:story_id => 1, :source => 1, :target => 2)
    l1.save(:validate => false)

    l2 = Link.new(:story_id => 1, :source => 1, :target => 3)
    l2.save(:validate => false)

    l3 = Link.new(:story_id => 2, :source => 5, :target => 6)
    l3.save(:validate => false)

    l4 = Link.new(:story_id => 2, :source => 5, :target => 7)
    l4.save(:validate => false)

    l6 = Link.new(:story_id => 2, :source => 9, :target => 8)
    l6.save(:validate => false)

    l7 = Link.new(:story_id => 2, :source => 7, :target => 9)
    l7.save(:validate => false)

    l8 = Link.new(:story_id => 2, :source => 8, :target => 10)
    l8.save(:validate => false)

    l10 = Link.new(:story_id => 2, :source => 6, :target => 9)
    l10.save(:validate => false)
    
    l11 = Link.new(:story_id => 2, :source => 8, :target => 11)
    l11.save(:validate => false)

  end

  def down
  	Story.delete_all
  	Node.delete_all
  end
end
