class LoadData < ActiveRecord::Migration
  def up
  	down

  	us1 = User.new(:username => "steph", :password => "pickles", :first_name => "Steph", :last_name => "D")
  	us2 = User.new(:username => "jj", :password => "pickles", :first_name => "JJ", :last_name => "L")
    us3 = User.new(:username => "skipper", :password => "pickles", :first_name => "Jess", :last_name => "L")
    us1.save
    us2.save
    us3.save

  	ts1a = Story.new(:summary => "A virus is ripping through the wizarding community that potions cannot cure. Against the wishes of the wizarding world, Hermione, now in her 7th year,
     recruits muggle scientists to help in creating a vaccine in order save everyone from a long and wasting death. But in doing so, she has revealed the wizarding world to the muggles...", :title => "The Muggle Virus")
  	ts1a.user = us3
    ts1a.genre = "fiction";
  	ts1a.save(:validate => false)


    ts1b = Story.new(:summary => "A virus is ripping through the wizarding community that potions cannot cure. Against the wishes of the wizarding world, Hermione, now in her 7th year,
     recruits muggle scientists to help in creating a vaccine in order save everyone from a long and wasting death. But in doing so, she has revealed the wizarding world to the muggles...", :title => "Muggle Virus")
    ts1b.user = us3
    ts1b.genre = "fiction";
    ts1b.save(:validate => false)

  	ts2a = Story.new(:summary => "On his 18th birthday, Jess shoots a mystic bow said to protect him by killing whomever is destined to one day kill him, three seconds before they attempt to. Seeing whom the arrow hits changes him forever.", :title => "The Guardian Bow")
  	ts2a.user = us3
    ts2a.genre = "fiction";
  	ts2a.save(:validate => false)


    ts2b = Story.new(:summary => "On his 18th birthday, Jess shoots a mystic bow said to protect him by killing whomever is destined to one day kill him, three seconds before they attempt to. Seeing whom the arrow hits changes him forever.", :title => "Guardian Bow")
    ts2b.user = us3
    ts2b.genre = "fiction";
    ts2b.save(:validate => false)


    ts3a = Story.new(:summary => "Gwen is working as a lowly spaceship janitor, dreaming of the day when she can fly her own ship. One day during her daily rounds, she discovers a stowaway in a utility closet who might just be the ticket to her success.", :title => "The Space Stowaway")
    ts3a.user = us3
    ts3a.genre = "fiction";
    ts3a.save(:validate => false)


    ts3b = Story.new(:summary => "Gwen is working as a lowly spaceship janitor, dreaming of the day when she can fly her own ship. One day during her daily rounds, she discovers a stowaway in a utility closet who might just be the ticket to her success.", :title => "Space Stowaway")
    ts3b.user = us3
    ts3b.genre = "fiction";
    ts3b.save(:validate => false)

    ts4a = Story.new(:summary => "Lee and Jamie are a married couple going about life. One day, they receive a letter in the mail informing them that they have been drafted by the government to participate in gladitorial fights.", :title => "")
    ts4a.user = us3
    ts4a.genre = "fiction";
    ts4a.save(:validate => false)


    ts4b = Story.new(:summary => "", :title => "")
    ts4b.user = us3
    ts4b.genre = "fiction";
    ts4b.save(:validate => false)

    ts5a = Story.new(:summary => "", :title => "")
    ts5a.user = us3
    ts5a.genre = "fiction";
    ts5a.save(:validate => false)


    ts5b = Story.new(:summary => "", :title => "")
    ts5b.user = us3
    ts5b.genre = "fiction";
    ts5b.save(:validate => false)

    ts6a = Story.new(:summary => "", :title => "")
    ts6a.user = us3
    ts6a.genre = "fiction";
    ts6a.save(:validate => false)


    ts6b = Story.new(:summary => "", :title => "")
    ts6b.user = us3
    ts6b.genre = "fiction";
    ts6b.save(:validate => false)


    n1 = Node.new(:text => "<p>&ldquo;But the Ministry forbade you from doing this,&rdquo; Harry hissed. &ldquo;Even McGonagall said no!&rdquo; He glanced over his shoulder again, but they would have heard anyone coming up the astronomy tower stairs, and he and Hermione were still alone.</p>

<p>&ldquo;I&rsquo;ve already done it, Harry.&rdquo; Hermione&rsquo;s earnestness had always been a bit scary, but she&rsquo;d never done something this crazy with it before. SPEW was one thing, but exposing the wizarding world to the muggles? Against the headmistress&rsquo;s specific orders? &ldquo;If we don&rsquo;t get the wizards vaccinated, more people are going to die.&rdquo;</p>

<p>After everything that had happened last year, after finally defeating Voldemort and getting a little bit of well-earned peace, a single year free from fear, was Hermione really planning to play wizarding ambassador to god-fearing, fantasy-book-reading muggles? Apparently, she already had. Harry buried his face in his hands. &ldquo;It&rsquo;s just the flu,&ldquo; he tried, almost hopelessly. </p>

<p>&ldquo;Harry, I don&rsquo;t think you understand,&rdquo; she said. &ldquo;This is not just the flu. St. Mungo&rsquo;s is overwhelmed with cases. There have been twenty reported deaths in three weeks -- that&rsquo;s thirty-nine percent mortality. It isn&rsquo;t responding to magic, and it isn&rsquo;t responding to the very few antivirals that the wizards have! The only reason the virus hasn&rsquo;t spread to the muggle population yet is because the magical community is so insular. Eventually, there is going to be a secondary contact. It&rsquo;s going to spread, and we have no idea what the mortality rate is going to be among non-magical people. There&rsquo;s an epidemic in the making. The only way to save the wizards is to get a muggle vaccine. And the only way to protect the muggles is if they know.&rdquo;</p>")
  	n1.user = us3
  	n1.truth = false
    n1.constraint_num = 0
  	n1.truth_height = 1
  	n1.story = ts1a
  	n1.save(:validate => false)

    n2 = Node.new(:text => "<p>&ldquo;But the Ministry forbade you from doing this,&rdquo; Harry hissed. &ldquo;Even McGonagall said no!&rdquo; He glanced over his shoulder again, but they would have heard anyone coming up the astronomy tower stairs, and he and Hermione were still alone.</p>

<p>&ldquo;I&rsquo;ve already done it, Harry.&rdquo; Hermione&rsquo;s earnestness had always been a bit scary, but she&rsquo;d never done something this crazy with it before. SPEW was one thing, but exposing the wizarding world to the muggles? Against the headmistress&rsquo;s specific orders? &ldquo;If we don&rsquo;t get the wizards vaccinated, more people are going to die.&rdquo;</p>

<p>After everything that had happened last year, after finally defeating Voldemort and getting a little bit of well-earned peace, a single year free from fear, was Hermione really planning to play wizarding ambassador to god-fearing, fantasy-book-reading muggles? Apparently, she already had. Harry buried his face in his hands. &ldquo;It&rsquo;s just the flu,&ldquo; he tried, almost hopelessly. </p>

<p>&ldquo;Harry, I don&rsquo;t think you understand,&rdquo; she said. &ldquo;This is not just the flu. St. Mungo&rsquo;s is overwhelmed with cases. There have been twenty reported deaths in three weeks -- that&rsquo;s thirty-nine percent mortality. It isn&rsquo;t responding to magic, and it isn&rsquo;t responding to the very few antivirals that the wizards have! The only reason the virus hasn&rsquo;t spread to the muggle population yet is because the magical community is so insular. Eventually, there is going to be a secondary contact. It&rsquo;s going to spread, and we have no idea what the mortality rate is going to be among non-magical people. There&rsquo;s an epidemic in the making. The only way to save the wizards is to get a muggle vaccine. And the only way to protect the muggles is if they know.&rdquo;</p>")
    n2.user = us3
    n2.truth = false
    n2.constraint_num = 0
    n2.truth_height = 1
    n2.story = ts1b
    n2.save(:validate => false)
    
    n3 = Node.new(:text => "<p>It's summer, one of those days that feels like walking through someone's warm, wet breath. A gross day. Jess is wandering around the fairgrounds with Barry Binninger, who's the son of his mom's friend Linda and who whines almost constantly. </p>
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
:quot<p>Jess looks back at the fair. The Ferris wheel glints in the ordinary late afternoon light, and in the sky, the trace of an airplane's tail shoots northward. </p>")
    n3.user = us3
    n3.truth = false
    n3.constraint_num = 0
    n3.truth_height = 1
    n3.story = ts2a
    n3.save(:validate => false)

    n4 = Node.new(:text => "<p>It's summer, one of those days that feels like walking through someone's warm, wet breath. A gross day. Jess is wandering around the fairgrounds with Barry Binninger, who's the son of his mom's friend Linda and who whines almost constantly. </p>
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
    n4.user = us3
    n4.truth = false
    n4.constraint_num = 0
    n4.truth_height = 1
    n4.story = ts2b
    n4.save(:validate => false)


    n5 = Node.new(:text => "<p><i>Clean up on deck three requested.  Clean up on deck three. </i> Gwen thumbed at her earpiece, turning off the eternally pleasant voice of the ship&rsquo;s monitoring software and signalling receipt of the message.  Deck 3 was the passenger dorms; almost certainly one of the tourists had vomited when the artificial gravity glitched out.  Gwen sighed.  &ldquo;Follow tight,&rdquo; she told her cart of tools and supplies, and with one last glance out at the stars, pushed off the wall of the viewing deck. She floated up towards the entrance, the little yellow cart following with a quiet humming at her heels. </p>

<p>
  She took the back passages of the ship, hoping to keep out of the way of people. Without the grav system, passengers would be banging into things and getting stuck on the ceilings, unused to the sudden lack of directionality.  The crew&rsquo;s tempers would be fraying, as they gave landlubbers gentle (or not so gentle) nudges in the direction they needed to go.  The head mechanic and his minions would be converging towards the engines and moderators, cursing at anyone in their way. Better to avoid it all. </p>
<p>
The halls were narrow, meant more as conduits for wiring and piping than for people.  But Gwen was small, and she knew the insides of the ship better than her own.  She shimmied past one of the monitoring bots crawling along the cables in the other direction, absently checking for the blue light that meant the bot was healthy.  </p>
<p>
  The helpless thing was flashing a sad orange, one of its legs jerking ineffectively as it tried to move. Something small and white was lodged in the joint; picking a screwdriver from the cart, Gwen pried it out and gave the bot a gentle push to get it started again. It flashed blue and moved slowly off, leaving her fingering a misplaced plastic screw.  A screw that should have been holding shut a ventilation access panel.</p>
<p>
  She glanced along the passage, searching for the nearest panel.  It was shut tightly, all screws in place.  But debris on a spaceship didn&rsquo;t appear from nowhere. Pulling a flashlight from her belt, she moved on to the next panel. Clean up on deck three, her earpiece reminded her, and she swiped it off without responding. This panel had been tampered with, empty boreholes like blind eyes along its edges.  Someone had been messing with her ship.  </p>
<p> Gwen levered the panel off, and peered in.  The flashlight reflected from two shining eyes, and someone curled up in the darkness whispered, &ldquo;Please don&rsquo;t hurt me.&rdquo;</p>
")
    n5.user = us3
    n5.truth = false
    n5.constraint_num = 0
    n5.truth_height = 1
    n5.story = ts3a
    n5.save(:validate => false)

    n6 = Node.new(:text => "<p><i>Clean up on deck three requested.  Clean up on deck three. </i> Gwen thumbed at her earpiece, turning off the eternally pleasant voice of the ship&rsquo;s monitoring software and signalling receipt of the message.  Deck 3 was the passenger dorms; almost certainly one of the tourists had vomited when the artificial gravity glitched out.  Gwen sighed.  &ldquo;Follow tight,&rdquo; she told her cart of tools and supplies, and with one last glance out at the stars, pushed off the wall of the viewing deck. She floated up towards the entrance, the little yellow cart following with a quiet humming at her heels. </p>

<p>
  She took the back passages of the ship, hoping to keep out of the way of people. Without the grav system, passengers would be banging into things and getting stuck on the ceilings, unused to the sudden lack of directionality.  The crew&rsquo;s tempers would be fraying, as they gave landlubbers gentle (or not so gentle) nudges in the direction they needed to go.  The head mechanic and his minions would be converging towards the engines and moderators, cursing at anyone in their way. Better to avoid it all. </p>
<p>
The halls were narrow, meant more as conduits for wiring and piping than for people.  But Gwen was small, and she knew the insides of the ship better than her own.  She shimmied past one of the monitoring bots crawling along the cables in the other direction, absently checking for the blue light that meant the bot was healthy.  </p>
<p>
  The helpless thing was flashing a sad orange, one of its legs jerking ineffectively as it tried to move. Something small and white was lodged in the joint; picking a screwdriver from the cart, Gwen pried it out and gave the bot a gentle push to get it started again. It flashed blue and moved slowly off, leaving her fingering a misplaced plastic screw.  A screw that should have been holding shut a ventilation access panel.</p>
<p>
  She glanced along the passage, searching for the nearest panel.  It was shut tightly, all screws in place.  But debris on a spaceship didn&rsquo;t appear from nowhere. Pulling a flashlight from her belt, she moved on to the next panel. Clean up on deck three, her earpiece reminded her, and she swiped it off without responding. This panel had been tampered with, empty boreholes like blind eyes along its edges.  Someone had been messing with her ship.  </p>
<p> Gwen levered the panel off, and peered in.  The flashlight reflected from two shining eyes, and someone curled up in the darkness whispered, &ldquo;Please don&rsquo;t hurt me.&rdquo;</p>
")
    n6.user = us3
    n6.truth = false
    n6.constraint_num = 0
    n6.truth_height = 1
    n6.story = ts3b
    n6.save(:validate => false)


    n7 = Node.new(:text => "")
    n7.user = us3
    n7.truth = false
    n7.constraint_num = 0
    n7.truth_height = 1
    n7.story = ts4a
    n7.save(:validate => false)

    n8 = Node.new(:text => "")
    n8.user = us3
    n8.truth = false
    n8.constraint_num = 0
    n8.truth_height = 1
    n8.story = ts4b
    n8.save(:validate => false)

    n9 = Node.new(:text => "")
    n9.user = us3
    n9.truth = false
    n9.constraint_num = 0
    n9.truth_height = 1
    n9.story = ts5a
    n9.save(:validate => false)

    n10 = Node.new(:text => "")
    n10.user = us3
    n10.truth = false
    n10.constraint_num = 0
    n10.truth_height = 1
    n10.story = ts5b
    n10.save(:validate => false)

    n11 = Node.new(:text => "")
    n11.user = us3
    n11.truth = false
    n11.constraint_num = 0
    n11.truth_height = 1
    n11.story = ts6a
    n11.save(:validate => false)

    n12 = Node.new(:text => "")
    n12.user = us3
    n12.truth = false
    n12.constraint_num = 0
    n12.truth_height = 1
    n12.story = ts6b
    n12.save(:validate => false)

    c1 = Constraint.new(:story_id => 1, :title => "Bandaid", :text => "The Ministry attempts to rectify the problem by Obliviating the muggles involved. ", :constraint_num => 0 )
    c1.save

    c2 = Constraint.new(:story_id => 1, :title => "The Storm", :text => "News spreads around the world, and several countries declare wizards a menace." , :constraint_num => 1 )
    c2.save

    c3 = Constraint.new(:story_id => 1, :title => "Family Ties", :text => "Hermione is put in a situation in which she must decide: save her family? Or the wizards?", :constraint_num =>2 )
    c3.save

    c4 = Constraint.new(:story_id => 1, :title => "Allegiances", :text => "'Harry, muggles abused you as a child. How can you support them now? Why do you protect them?'", :constraint_num =>3 )
    c4.save

    c5 = Constraint.new(:story_id => 1, :title => "Taken", :text => "Hermione strained against her shackles. She wondered if there was anyone left who would come for her.", :constraint_num =>4 )
    c5.save

    c21 = Constraint.new(:story_id => 3, :title => "Going Away", :text => "Jess is moving his things into the car, getting ready to go to college. His mom whispers to him.", :constraint_num => 0 )
    c21.save

    c22 = Constraint.new(:story_id => 3, :title => "Suspicions", :text => "Something at work makes Jess suspect that he may need the help of the bow soon.", :constraint_num => 1 )
    c22.save

    c23 = Constraint.new(:story_id => 3, :title => "Strike", :text => "It’s been eight years since the day of the carnival. An arrow strikes his girlfriend’s heart, just as she says “I do”.", :constraint_num =>2 )
    c23.save

    c24 = Constraint.new(:story_id => 3, :title => "Knowing", :text => "Jess learns something that makes him search desperately for the bow.", :constraint_num =>3 )
    c24.save

    c25 = Constraint.new(:story_id => 3, :title => "Wants and Needs", :text => "Jess has a moral conflict, where he has to decide between what is right and what is easy.", :constraint_num =>4 )
    c25.save


    c31 = Constraint.new(:story_id => 5, :title => "The Story", :text => "The stowaway reveals his past.", :constraint_num => 0 )
    c31.save

    c32 = Constraint.new(:story_id => 5, :title => "Found", :text => "Someone discovers the stowaway!", :constraint_num => 1 )
    c32.save

    c33 = Constraint.new(:story_id => 5, :title => "Crisis", :text => "Emergency on the spaceship!", :constraint_num =>2 )
    c33.save

    c34 = Constraint.new(:story_id => 5, :title => "Confusion", :text => "Space janitor wakes up with a spoon lodged between her ribs.", :constraint_num =>3 )
    c34.save

    c35 = Constraint.new(:story_id => 5, :title => "Two Ways", :text => "The glass cracks. ", :constraint_num =>4 )
    c35.save


    c41 = Constraint.new(:story_id => 7, :title => "", :text => "", :constraint_num => 0 )
    c41.save

    c42 = Constraint.new(:story_id => 7, :title => "", :text => "", :constraint_num => 1 )
    c42.save

    c43 = Constraint.new(:story_id => 7, :title => "", :text => "", :constraint_num =>2 )
    c43.save

    c44 = Constraint.new(:story_id => 7, :title => "", :text => "", :constraint_num =>3 )
    c44.save

    c45 = Constraint.new(:story_id => 7, :title => "", :text => "", :constraint_num =>4 )
    c45.save


  end

  def down
  	Story.delete_all
  	Node.delete_all
  end
end
