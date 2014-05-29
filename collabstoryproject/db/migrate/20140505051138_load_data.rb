class LoadData < ActiveRecord::Migration
  def up
  	down

  	us1 = User.new(:username => "steph", :password => "pickles", :first_name => "Steph", :last_name => "D")
  	us2 = User.new(:username => "jj", :password => "pickles", :first_name => "JJ", :last_name => "L")
    us3 = User.new(:username => "skipper", :password => "pickles", :first_name => "Jess", :last_name => "L")
    us1.save
    us2.save
    us3.save

  	ts1 = Story.new(:summary => "A virus is ripping through the wizarding community that potions cannot cure. Against the wishes of the wizarding world, Hermione, now in her 7th year,
     recruits muggle scientists to help in creating a vaccine in order save everyone from a long and wasting death. But in doing so, she has revealed the wizarding world to the muggles...", :title => "The Muggle Virus")
  	ts1.user = us3
    ts1.genre = "fiction";
  	ts1.save(:validate => false)

  	ts2 = Story.new(:summary => "On his 18th birthday, Jess shoots a mystic bow said to kill whomever is destined to kill him, three seconds before they do in the future. Whom it pierces
      changes him completey.", :title => "Death Bow")
  	ts2.user = us3
    ts2.genre = "fiction";
  	ts2.save(:validate => false)

    ts3 = Story.new(:summary =>"Harry finally has the horcrux, but...", :title => "Thirteen")
    ts3.user = us3
    ts3.genre = "fiction"
    ts3.save(:validate => false)

    n1 = Node.new(:text => "<p>&ldquo;But the Ministry forbade you from doing this,&rdquo; Harry hissed. &ldquo;Even McGonagall said no!&rdquo; He glanced over his shoulder again, but they would have heard anyone coming up the astronomy tower stairs, and he and Hermione were still alone.</p>

<p>&ldquo;I&rsquo;ve already done it, Harry.&rdquo; Hermione&rsquo;s earnestness had always been a bit scary, but she&rsquo;d never done something this crazy with it before. SPEW was one thing, but exposing the wizarding world to the muggles? Against the headmistress&rsquo;s specific orders? &ldquo;If we don&rsquo;t get the wizards vaccinated, more people are going to die.&rdquo;</p>

<p>After everything that had happened last year, after finally defeating Voldemort and getting a little bit of well-earned peace, a single year free from fear, was Hermione really planning to play wizarding ambassador to god-fearing, fantasy-book-reading muggles? Apparently, she already had. Harry buried his face in his hands. &ldquo;It&rsquo;s just the flu,&ldquo; he tried, almost hopelessly. </p>

<p>&ldquo;Harry, I don&rsquo;t think you understand,&rdquo; she said. &ldquo;This is not just the flu. St. Mungo&rsquo;s is overwhelmed with cases. There have been twenty reported deaths in three weeks -- that&rsquo;s thirty-nine percent mortality. It isn&rsquo;t responding to magic, and it isn&rsquo;t responding to the very few antivirals that the wizards have! The only reason the virus hasn&rsquo;t spread to the muggle population yet is because the magical community is so insular. Eventually, there is going to be a secondary contact. It&rsquo;s going to spread, and we have no idea what the mortality rate is going to be among non-magical people. There&rsquo;s an epidemic in the making. The only way to save the wizards is to get a muggle vaccine. And the only way to protect the muggles is if they know.&rdquo;</p>")
  	n1.user = us3
  	n1.truth = false
    n1.truth_height = 1
  	n1.truth_height = 0
  	n1.story = ts1
  	n1.save(:validate => false)
    
    n2 = Node.new(:text => "<p>It's summer, one of those days that feels like walking through someone's warm, wet breath. A gross day. Jess is wandering around the fairgrounds with Barry Binninger, who's the son of his mom's friend Linda and who whines almost constantly. </p>
<p>They're walking along the row of games. Jess only has a dollar, so he has to pick something he can win. The ring toss game is bullshit. He's seen probably twenty people lose their money on it since they got here. He's pretty sure the necks of the bottles are too big to toss a ring onto, anyway.</p>
<p>&quot;This place is a total rip-off.&quot; Barry scuffs his way toward the nearest bench and plops down like a pillowcase full of sand.</p>
<p>Jess looks at the game next to him. The guy manning the booth is pretty sketchy -- red hair slicked back and a missing front tooth. He's holding a bow and arrow.</p>
<p>&quot;Wanna try your luck?&quot; the booth guys says. &quot;Winner gets the best prize at the carnival.&quot; </p>
<p>&quot;Yeah?&quot; Jess says. &quot;What's that? A teddy bear that doesn't smell like shit?&quot;</p>
<p>The man cracks a smile. &quot;It's a mystery prize. Fifty cents to play.&quot;</p>
<p>Jess is pretty sure he knows what a mystery prize is, and it involves twenty years of therapy after you leave the carnival. &quot;No thanks, man.&quot; </p>
<p>He turns, and the man lurches forward and grabs his wrist. Jess turns to look at him. The man's eyes are so dilated that they're almost completely black. Jess' stomach lurches and he pulls his hand away.</p>
<p>&quot;Take the bow,&quot; the man says, and Jess swallows. His heart is suddenly pounding, and he can't say why.</p>
<p>He nods and reaches for the bow. In the background, he can hear Barry whining faintly -- &quot;hey man, don't spend all your money here&quot; -- but the words are like waves lapping softly against him. He can only focus on the bow as the man places it into his hands. </p>
<p>&quot;Aim at heaven,&quot; the man says.</p>
<p>Jess has only fired a bow in gym, and he wasn't even good at it then. But the arrow slides into place naturally. The pull of his shoulder muscle feels practiced and sure. He releases the arrow and watches as it soars up, up -- impossibly high, over the carnival tent and out of sight.</p>
<p>Adrenaline rushes out of him and he looks down at the bow. He suddenly feels like he's about to cry. It's the hollow, melancholy feeling of someone revealing the end of a book when you're halfway through. It pierces him cleanly.</p>
<p>&quot;He who would take your life,&quot; the man says, &quot;now take his.&quot;</p><p>&quot;What?&quot; Jess says.</p>
<p>&quot;Now take his,&quot; the man says. </p>
<p>Jess can't breathe. He gasps, a few ragged breaths. &quot;Keep the money,&quot; he says, and turns away. He stumbles toward the Ferris wheel, and then he's running, running hysterically, out into the parking lot.</p>
<p>Barry finds him bent double over a red Honda Civic, panting. &quot;Hey man, not cool,&quot; Barry says. &quot;You can't just take off like that.&quot;</p>
<p>Jess looks back at the fair. The Ferris wheel glints in the ordinary late afternoon light, and in the sky, the trace of an airplane's tail shoots northward. </p>")
    n2.user = us3
    n2.truth = false
    n2.truth_height = 1
    n2.truth_height = 0
    n2.story = ts2
    n2.save(:validate => false)

  	n3 = Node.new(:text => "Brad and six other guys painted their whole chests.  He had a big red cape as well.  
      That was the start of a long history of more and more epic football costumes. He ended up in a couple of news
      articles as the 'picture of Stanford fans', since he was the craziest dressed of anybody there.  Except the
      band.  Not many people can beat the band.")
    n3.user = us3
    n3.truth = false
    n3.truth_height = 1
    n3.truth_height = 0
    n3.story = ts3
    n3.save(:validate => false)

    c1 = Constraint.new(:story_id => 1, :title => "Bandaid", :text => "The Ministry attempts to rectify the problem by Obliviating the muggles involved. ", :constraint_num => 1 )
    c1.save

    c2 = Constraint.new(:story_id => 1, :title => "The Storm", :text => "News spreads around the world, and several countries declare wizards a menace." , :constraint_num => 2 )
    c2.save

    c3 = Constraint.new(:story_id => 1, :title => "Family Ties", :text => "Hermione is put in a situation in which she must decide: save her family? Or the wizards?", :constraint_num =>3 )
    c3.save

    c4 = Constraint.new(:story_id => 1, :title => "Allegiances", :text => "'Harry, muggles abused you as a child. How can you support them now? Why do you protect them?'", :constraint_num =>4 )
    c4.save

    c5 = Constraint.new(:story_id => 1, :title => "Taken", :text => "Hermione strained against her shackles. She wondered if there was anyone left who would come for her.", :constraint_num =>5 )
    c5.save



  end

  def down
  	Story.delete_all
  	Node.delete_all
  end
end
