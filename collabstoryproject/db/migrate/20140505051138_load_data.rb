class LoadData < ActiveRecord::Migration
  def up
  	down

  	us1 = User.new(:username => "steph", :password => "pickles", :first_name => "Steph", :last_name => "D")
  	us2 = User.new(:username => "jj", :password => "pickles", :first_name => "JJ", :last_name => "L")
    us3 = User.new(:username => "skipper", :password => "pickles", :first_name => "Jess", :last_name => "L")
    us1.test_group = 1;
    us2.test_group = 2;
    us3.test_group = 1;
    us1.save
    us2.save
    us3.save

  	ts1a = Story.new(:summary => "A virus is ripping through the wizarding community that potions cannot cure. Against the wishes of the wizarding world, Hermione, now in her 7th year,
     recruits muggle scientists to help in creating a vaccine in order save everyone from a long and wasting death. But in doing so, she has revealed the wizarding world to the muggles...", :title => "The Muggle Virus")
  	ts1a.user = us3
    ts1a.test_group = 1
    ts1a.genre = "fiction";
  	ts1a.save(:validate => false)


    ts1b = Story.new(:summary => "A virus is ripping through the wizarding community that potions cannot cure. Against the wishes of the wizarding world, Hermione, now in her 7th year,
     recruits muggle scientists to help in creating a vaccine in order save everyone from a long and wasting death. But in doing so, she has revealed the wizarding world to the muggles...", :title => "Muggle Virus")
    ts1b.user = us3
    ts1b.test_group = 2
    ts1b.genre = "fiction";
    ts1b.save(:validate => false)

  	ts2a = Story.new(:summary => "On his 18th birthday, Jess shoots a mystic bow said to protect him by killing whomever is destined to one day kill him, three seconds before they attempt to. Seeing whom the arrow hits changes him forever.", :title => "The Guardian Bow")
  	ts2a.user = us3
    ts2a.test_group = 2
    ts2a.genre = "fiction";
  	ts2a.save(:validate => false)


    ts2b = Story.new(:summary => "On his 18th birthday, Jess shoots a mystic bow said to protect him by killing whomever is destined to one day kill him, three seconds before they attempt to. Seeing whom the arrow hits changes him forever.", :title => "Guardian Bow")
    ts2b.user = us3
    ts2b.test_group = 1
    ts2b.genre = "fiction";
    ts2b.save(:validate => false)


    ts3a = Story.new(:summary => "Gwen is working as a lowly spaceship janitor, dreaming of the day when she can fly her own ship. One day during her daily rounds, she discovers a stowaway in a utility closet who might just be the ticket to her success.", :title => "The Space Stowaway")
    ts3a.user = us3
    ts3a.test_group = 1
    ts3a.genre = "fiction";
    ts3a.save(:validate => false)


    ts3b = Story.new(:summary => "Gwen is working as a lowly spaceship janitor, dreaming of the day when she can fly her own ship. One day during her daily rounds, she discovers a stowaway in a utility closet who might just be the ticket to her success.", :title => "Space Stowaway")
    ts3b.user = us3
        ts3b.test_group = 2
    ts3b.genre = "fiction";
    ts3b.save(:validate => false)

    ts4a = Story.new(:summary => "Lee and Jamie are a married couple. It is 2090, but marriage still works the same way. Civic duty, however, does not. Lee and Jamie are drafted into the gladitorial fights, which the government puts on as a lucrative means of population control.", :title => "The Carrying Capacity")
    ts4a.user = us3
        ts4a.test_group = 2
    ts4a.genre = "fiction";
    ts4a.save(:validate => false)


    ts4b = Story.new(:summary => "Lee and Jamie are a married couple. It is 2090, but marriage still works the same way. Civic duty, however, does not. Lee and Jamie are drafted into the gladitorial fights, which the government puts on as a lucrative means of population control.", :title => "Carrying Capacity")
    ts4b.user = us3
        ts4b.test_group = 1
    ts4b.genre = "fiction";
    ts4b.save(:validate => false)

    ts5a = Story.new(:summary => "During a break between cases, Charlie turns up out of the blue, uninvited, at Emily&apos;s door and just...doesn&apos;t leave. As standard a love story as you choose to make it to be.", :title => "The Home Life")
    ts5a.user = us3
        ts5a.test_group = 1
    ts5a.genre = "fiction";
    ts5a.save(:validate => false)


    ts5b = Story.new(:summary => "During a break between cases, Charlie turns up out of the blue, uninvited, at Emily&apos;s door and just...doesn&apos;t leave. As standard a love story as you choose to make it to be.", :title => "The Home Life")
    ts5b.user = us3
        ts5b.test_group = 2
    ts5b.genre = "fiction";
    ts5b.save(:validate => false)

    ts6a = Story.new(:summary => "Nate is a Switcher--someone who switches into another person\'s life, unbidden, every year. He\'s been a waitress, a car salesman, a stockbroker, and then some. Now nearing his 27th birthday, Nate is about to switch again, but this time into someone far less innocuous.", :title => "Switch")
    ts6a.user = us3
        ts6a.test_group = 2
    ts6a.genre = "fiction";
    ts6a.save(:validate => false)


    ts6b = Story.new(:summary => "Nate is a Switcher--someone who switches into another person\'s life, unbidden, every year. He\'s been a waitress, a car salesman, a stockbroker, and then some. Now nearing his 27th birthday, Nate is about to switch again, but this time into someone far less innocuous.", :title => "Switch")
    ts6b.user = us3
        ts6b.test_group = 1
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
    
    n3 = Node.new(:text => "<p>It&apos;s summer, one of those days that feels like walking through someone&apos;s warm, wet breath. A gross day. Jess is wandering around the fairgrounds with Barry Binninger, who&apos;s the son of his mom&apos;s friend Linda and who whines almost constantly. </p>
<p>They&apos;re walking along the row of games. Jess only has a dollar, so he has to pick something he can win. The ring toss game is bullshit. He&apos;s seen probably twenty people lose their money on it since they got here. He&apos;s pretty sure the necks of the bottles are too big to toss a ring onto, anyway.</p>
<p>&quot;This place is a total rip-off.&quot; Barry scuffs his way toward the nearest bench and plops down like a pillowcase full of sand.</p>
<p>Jess looks at the game next to him. The guy manning the booth is pretty sketchy -- red hair slicked back and a missing front tooth. He&apos;s holding a bow and arrow.</p>
<p>&quot;Wanna try your luck?&quot; the booth guys says. &quot;Winner gets the best prize at the carnival.&quot; </p>
<p>&quot;Yeah?&quot; Jess says. &quot;What&apos;s that? A teddy bear that doesn&apos;t smell like shit?&quot;</p>
<p>The man cracks a smile. &quot;It&apos;s a mystery prize. Fifty cents to play.&quot;</p>
<p>Jess is pretty sure he knows what a mystery prize is, and it involves twenty years of therapy after you leave the carnival. &quot;No thanks, man.&quot; </p>
<p>He turns, and the man lurches forward and grabs his wrist. Jess turns to look at him. The man&apos;s eyes are so dilated that they&apos;re almost completely black. Jess&apos; stomach lurches and he pulls his hand away.</p>
<p>&quot;Take the bow,&quot; the man says, and Jess swallows. His heart is suddenly pounding, and he can&apos;t say why.</p>
<p>He nods and reaches for the bow. In the background, he can hear Barry whining faintly -- &quot;hey man, don&apos;t spend all your money here&quot; -- but the words are like waves lapping softly against him. He can only focus on the bow as the man places it into his hands. </p>
<p>&quot;Aim at heaven,&quot; the man says.</p>
<p>Jess has only fired a bow in gym, and he wasn&apos;t even good at it then. But the arrow slides into place naturally. The pull of his shoulder muscle feels practiced and sure. He releases the arrow and watches as it soars up, up -- impossibly high, over the carnival tent and out of sight.</p>
<p>Adrenaline rushes out of him and he looks down at the bow. He suddenly feels like he&apos;s about to cry. It&apos;s the hollow, melancholy feeling of someone revealing the end of a book when you&apos;re halfway through. It pierces him cleanly.</p>
<p>&quot;He who would take your life,&quot; the man says, &quot;now take his.&quot;</p><p>&quot;What?&quot; Jess says.</p>
<p>&quot;Now take his,&quot; the man says. </p>
<p>Jess can&apos;t breathe. He gasps, a few ragged breaths. &quot;Keep the money,&quot; he says, and turns away. He stumbles toward the Ferris wheel, and then he&apos;s running, running hysterically, out into the parking lot.</p>
<p>Barry finds him bent double over a red Honda Civic, panting. &quot;Hey man, not cool,&quot; Barry says. &quot;You can&apos;t just take off like that.&quot;</p>
:quot<p>Jess looks back at the fair. The Ferris wheel glints in the ordinary late afternoon light, and in the sky, the trace of an airplane&apos;s tail shoots northward. </p>")
    n3.user = us3
    n3.truth = false
    n3.constraint_num = 0
    n3.truth_height = 1
    n3.story = ts2a
    n3.save(:validate => false)

    n4 = Node.new(:text => "<p>It&apos;s summer, one of those days that feels like walking through someone&apos;s warm, wet breath. A gross day. Jess is wandering around the fairgrounds with Barry Binninger, who&apos;s the son of his mom&apos;s friend Linda and who whines almost constantly. </p>
<p>They&apos;re walking along the row of games. Jess only has a dollar, so he has to pick something he can win. The ring toss game is bullshit. He&apos;s seen probably twenty people lose their money on it since they got here. He&apos;s pretty sure the necks of the bottles are too big to toss a ring onto, anyway.</p>
<p>&quot;This place is a total rip-off.&quot; Barry scuffs his way toward the nearest bench and plops down like a pillowcase full of sand.</p>
<p>Jess looks at the game next to him. The guy manning the booth is pretty sketchy -- red hair slicked back and a missing front tooth. He&apos;s holding a bow and arrow.</p>
<p>&quot;Wanna try your luck?&quot; the booth guys says. &quot;Winner gets the best prize at the carnival.&quot; </p>
<p>&quot;Yeah?&quot; Jess says. &quot;What&apos;s that? A teddy bear that doesn&apos;t smell like shit?&quot;</p>
<p>The man cracks a smile. &quot;It&apos;s a mystery prize. Fifty cents to play.&quot;</p>
<p>Jess is pretty sure he knows what a mystery prize is, and it involves twenty years of therapy after you leave the carnival. &quot;No thanks, man.&quot; </p>
<p>He turns, and the man lurches forward and grabs his wrist. Jess turns to look at him. The man&apos;s eyes are so dilated that they&apos;re almost completely black. Jess&apos; stomach lurches and he pulls his hand away.</p>
<p>&quot;Take the bow,&quot; the man says, and Jess swallows. His heart is suddenly pounding, and he can&apos;t say why.</p>
<p>He nods and reaches for the bow. In the background, he can hear Barry whining faintly -- &quot;hey man, don&apos;t spend all your money here&quot; -- but the words are like waves lapping softly against him. He can only focus on the bow as the man places it into his hands. </p>
<p>&quot;Aim at heaven,&quot; the man says.</p>
<p>Jess has only fired a bow in gym, and he wasn&apos;t even good at it then. But the arrow slides into place naturally. The pull of his shoulder muscle feels practiced and sure. He releases the arrow and watches as it soars up, up -- impossibly high, over the carnival tent and out of sight.</p>
<p>Adrenaline rushes out of him and he looks down at the bow. He suddenly feels like he&apos;s about to cry. It&apos;s the hollow, melancholy feeling of someone revealing the end of a book when you&apos;re halfway through. It pierces him cleanly.</p>
<p>&quot;He who would take your life,&quot; the man says, &quot;now take his.&quot;</p><p>&quot;What?&quot; Jess says.</p>
<p>&quot;Now take his,&quot; the man says. </p>
<p>Jess can&apos;t breathe. He gasps, a few ragged breaths. &quot;Keep the money,&quot; he says, and turns away. He stumbles toward the Ferris wheel, and then he&apos;s running, running hysterically, out into the parking lot.</p>
<p>Barry finds him bent double over a red Honda Civic, panting. &quot;Hey man, not cool,&quot; Barry says. &quot;You can&apos;t just take off like that.&quot;</p>
<p>Jess looks back at the fair. The Ferris wheel glints in the ordinary late afternoon light, and in the sky, the trace of an airplane&apos;s tail shoots northward. </p>")
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


    n7 = Node.new(:text => "<p>&ldquo;Mail&rsquo;s here.&rdquo;</p>
<p> Jamie tossed the stack of letters on the kitchen table, dropping her jacket across the back of a chair and bending down to unlace her muddy boots.  Lee leaned against the sink, his back to her, a shadow against the pale glow of dusk that had clawed its way into the alley and through their kitchen window. Soap suds spotted his arms, sleeves pushed up to his elbows, but the sink had drained to empty. &ldquo;Power&rsquo;s out again.&rdquo; </p>
<p>&ldquo;You okay?&rdquo; Jamie toggled the light switch, not disbelieving him, but trying anyway.  The elevator had been out on the way up, but that wasn&rsquo;t altogether uncommon. The bulb on the ceiling stayed stubbornly dark; the apartment oddly quiet without the hum of appliances or music from the neighbors&rsquo; stereo thumping through the walls. </p>
<p>Lee&rsquo;s shoulders slumped a bit.  The water hissed on and he rinsed his hands off, patting them dry with a towel.  &ldquo;Dinner&rsquo;s in the fridge,&rdquo; he said. &ldquo;Anything other than bills?&rdquo; </p>
<p>Jamie blew out a slow breath, letting frustration seep out with the air.  She flipped through envelopes and junk magazines, sorting the pile into crap and bills. </p> 
<p>&ldquo;Something,&rdquo; she said, squinting at a long envelope with an official seal on the front.  It was too dark to make out clearly. &ldquo;Looks like jury duty.&rdquo; She held it out. </p>
<p>Lee took it from the far end, his fingers staying a letter&rsquo;s length from hers.  She saw the distance more clearly than the words on the envelope, watching his hands as he moved to the window to tilt it to the fading light.  Paper tearing joined the drip of the faucet in the heavy silence of the power outage. </p>
<p>The letter drifted down like a wilted leaf to settle in the damp sink. Lee turned to her, and his eyes had more expression in them than he&rsquo;d shown her in weeks. For a moment, something almost like happiness thrilled through her. </p>
<p>&ldquo;We&rsquo;ve been called up,&rdquo; he said, and her stomach turned to stone. &ldquo;We&rsquo;ve been called to the Arena.&rdquo; </p>")
    n7.user = us3
    n7.truth = false
    n7.constraint_num = 0
    n7.truth_height = 1
    n7.story = ts4a
    n7.save(:validate => false)

    n8 = Node.new(:text => "<p>&ldquo;Mail&rsquo;s here.&rdquo;</p>
<p> Jamie tossed the stack of letters on the kitchen table, dropping her jacket across the back of a chair and bending down to unlace her muddy boots.  Lee leaned against the sink, his back to her, a shadow against the pale glow of dusk that had clawed its way into the alley and through their kitchen window. Soap suds spotted his arms, sleeves pushed up to his elbows, but the sink had drained to empty. &ldquo;Power&rsquo;s out again.&rdquo; </p>
<p>&ldquo;You okay?&rdquo; Jamie toggled the light switch, not disbelieving him, but trying anyway.  The elevator had been out on the way up, but that wasn&rsquo;t altogether uncommon. The bulb on the ceiling stayed stubbornly dark; the apartment oddly quiet without the hum of appliances or music from the neighbors&rsquo; stereo thumping through the walls. </p>
<p>Lee&rsquo;s shoulders slumped a bit.  The water hissed on and he rinsed his hands off, patting them dry with a towel.  &ldquo;Dinner&rsquo;s in the fridge,&rdquo; he said. &ldquo;Anything other than bills?&rdquo; </p>
<p>Jamie blew out a slow breath, letting frustration seep out with the air.  She flipped through envelopes and junk magazines, sorting the pile into crap and bills. </p> 
<p>&ldquo;Something,&rdquo; she said, squinting at a long envelope with an official seal on the front.  It was too dark to make out clearly. &ldquo;Looks like jury duty.&rdquo; She held it out. </p>
<p>Lee took it from the far end, his fingers staying a letter&rsquo;s length from hers.  She saw the distance more clearly than the words on the envelope, watching his hands as he moved to the window to tilt it to the fading light.  Paper tearing joined the drip of the faucet in the heavy silence of the power outage. </p>
<p>The letter drifted down like a wilted leaf to settle in the damp sink. Lee turned to her, and his eyes had more expression in them than he&rsquo;d shown her in weeks. For a moment, something almost like happiness thrilled through her. </p>
<p>&ldquo;We&rsquo;ve been called up,&rdquo; he said, and her stomach turned to stone. &ldquo;We&rsquo;ve been called to the Arena.&rdquo; </p>")
    n8.user = us3
    n8.truth = false
    n8.constraint_num = 0
    n8.truth_height = 1
    n8.story = ts4b
    n8.save(:validate => false)

    n9 = Node.new(:text => "<p>Charlie shows up at Emily&apos;s door, duffel bag in one hand, a crate of files in the other.</p>

<p>&quot;Damn, I missed you,&quot; Charlie laughs, tackling Emily and sitting on her. &quot;You and your grimace and your stupid hair.&quot; And Charlie ruffles her hair and kisses her on the temple, quick and annoying like, just a slobbery smack of lips on the forehead.</p>

<p>&quot;Buy me dinner, now,&quot; he says then, standing up and offering her a hand.</p>

<p>&quot;Okay?&quot; Emily blinks and slowly nods her head. Really, she can&apos;t think of anything else to do.</p>

<p>The next day, Emily wakes up with a cup of coffee on her nightstand and ice cold feet pressing hard into her knee under the covers. &quot;Move over,&quot; he says, sliding under the blankets and nudging Emily over not-quite-carefully. &quot;It&apos;s fucking freezing out there, Em. Have you never heard of that thing they call a heater?&quot;</p>

<p>He hands Emily the cup of coffee and stretches dramatically, back popping and joints cracking and absolutely ruining her perfect morning silence. Emily stares at him over the rim of the cup. </p>

<p>&quot;Your bed is awesome,&quot; he says, curling up and stealing Emily&apos;s pillow. &quot;Awesome. But your guest futon is a piece of shit.&quot; Charlie closes his eyes, bliss on his face. Emily drinks her coffee and watches him sleep for a half hour before kicking him the stomach and out of the bed.</p>

<p>&quot;Out, asshole.&quot; Emily says, and alright, even Emily can admit that maybe some of the sting in the threat is lost after half an hour of almost cuddling, but whatever.</p> 

<p>Charlie flips her off from where he&apos;s lying on the floor. &quot;You&apos;re watching Game of Thrones with me today. Don&apos;t even try to get out of it.&quot;</p>

<p>He languidly picks himself off the floor, and Emily&apos;s pretty sure she hears the cackle of laughter from the bathroom.</p>")
    n9.user = us3
    n9.truth = false
    n9.constraint_num = 0
    n9.truth_height = 1
    n9.story = ts5a
    n9.save(:validate => false)

    n10 = Node.new(:text => "<p>Charlie shows up at Emily&apos;s door, duffel bag in one hand, a crate of files in the other.</p>

<p>&quot;Damn, I missed you,&quot; Charlie laughs, tackling Emily and sitting on her. &quot;You and your grimace and your stupid hair.&quot; And Charlie ruffles her hair and kisses her on the temple, quick and annoying like, just a slobbery smack of lips on the forehead.</p>

<p>&quot;Buy me dinner, now,&quot; he says then, standing up and offering her a hand.</p>

<p>&quot;Okay?&quot; Emily blinks and slowly nods her head. Really, she can&apos;t think of anything else to do.</p>

<p>The next day, Emily wakes up with a cup of coffee on her nightstand and ice cold feet pressing hard into her knee under the covers. &quot;Move over,&quot; he says, sliding under the blankets and nudging Emily over not-quite-carefully. &quot;It&apos;s fucking freezing out there, Em. Have you never heard of that thing they call a heater?&quot;</p>

<p>He hands Emily the cup of coffee and stretches dramatically, back popping and joints cracking and absolutely ruining her perfect morning silence. Emily stares at him over the rim of the cup. </p>

<p>&quot;Your bed is awesome,&quot; he says, curling up and stealing Emily&apos;s pillow. &quot;Awesome. But your guest futon is a piece of shit.&quot; Charlie closes his eyes, bliss on his face. Emily drinks her coffee and watches him sleep for a half hour before kicking him the stomach and out of the bed.</p>

<p>&quot;Out, asshole.&quot; Emily says, and alright, even Emily can admit that maybe some of the sting in the threat is lost after half an hour of almost cuddling, but whatever.</p> 

<p>Charlie flips her off from where he&apos;s lying on the floor. &quot;You&apos;re watching Game of Thrones with me today. Don&apos;t even try to get out of it.&quot;</p>

<p>He languidly picks himself off the floor, and Emily&apos;s pretty sure she hears the cackle of laughter from the bathroom.</p>")
    n10.user = us3
    n10.truth = false
    n10.constraint_num = 0
    n10.truth_height = 1
    n10.story = ts5b
    n10.save(:validate => false)

    n11 = Node.new(:text => "<p>---------------------------------------------------------------------------------------</p>

<p>Over the next few weeks, Charlie and Emily work out a routine of living together. </p>

<p>When Emily climbs out of bed in the morning, Charlie has a pot of coffee waiting for her, and a stack of buttered toast (she doesn&apos;t think he can make anything else). Emily will grab them both on the way out the door, grunt her thanks at Charlie, and forget her wallet and keys on the kitchen table. Charlie will chase her out of the apartment and shove them both in Emily&apos;s pockets before rushing back inside. Usually before the door closes, and he gets locked out. Sometimes not.</p>

<p>At first the whole thing is weird because this is Charlie, her acquaintance-friend for years now, and he does everything his own way, and it&apos;s not Emily&apos;s way. Emily ends up bitching about the wet towels on the bathroom floor and the weird hipster beers stacked in all her closets, and her now always-sad, empty refrigerator, but still, it&apos;s Charlie and so she can&apos;t really be all that pissed. </p>

<p>At night, they watch TV together and Charlie&apos;s got an opinion about everything. Emily&apos;s pretty sure that it&apos;s the polar opposite of her opinion on purpose, but she can&apos;t prove anything. They don&apos;t talk about their respective days at work, or even what they ate for lunch. Instead, they spend an hour debating Jaime and Cersei and who conceded to whom, and Charlie won&apos;t shut the fuck up until Emily storms out of the room, slamming her door shut and barricading herself in, promising herself over and over until most of an hour later that she will never again watch GoT with Charlie.</p>

<p>At least until next week.</p>

<p>She figures that at some point, she should probably why Charlie&apos;s here or, even better, why Charlie&apos;s apparently decided to move in with her. When Charlie shows up the next day with a crock pot, she figures it&apos;s time to broach the subject. </p>")
    n11.user = us3
    n11.truth = false
    n11.constraint_num = 0
    n11.truth_height = 1
    n11.story = ts5a
    n11.save(:validate => false)

    n12 = Node.new(:text => "<p>---------------------------------------------------------------------------------------</p>

<p>Over the next few weeks, Charlie and Emily work out a routine of living together. </p>

<p>When Emily climbs out of bed in the morning, Charlie has a pot of coffee waiting for her, and a stack of buttered toast (she doesn&apos;t think he can make anything else). Emily will grab them both on the way out the door, grunt her thanks at Charlie, and forget her wallet and keys on the kitchen table. Charlie will chase her out of the apartment and shove them both in Emily&apos;s pockets before rushing back inside. Usually before the door closes, and he gets locked out. Sometimes not.</p>

<p>At first the whole thing is weird because this is Charlie, her acquaintance-friend for years now, and he does everything his own way, and it&apos;s not Emily&apos;s way. Emily ends up bitching about the wet towels on the bathroom floor and the weird hipster beers stacked in all her closets, and her now always-sad, empty refrigerator, but still, it&apos;s Charlie and so she can&apos;t really be all that pissed. </p>

<p>At night, they watch TV together and Charlie&apos;s got an opinion about everything. Emily&apos;s pretty sure that it&apos;s the polar opposite of her opinion on purpose, but she can&apos;t prove anything. They don&apos;t talk about their respective days at work, or even what they ate for lunch. Instead, they spend an hour debating Jaime and Cersei and who conceded to whom, and Charlie won&apos;t shut the fuck up until Emily storms out of the room, slamming her door shut and barricading herself in, promising herself over and over until most of an hour later that she will never again watch GoT with Charlie.</p>

<p>At least until next week.</p>

<p>She figures that at some point, she should probably why Charlie&apos;s here or, even better, why Charlie&apos;s apparently decided to move in with her. When Charlie shows up the next day with a crock pot, she figures it&apos;s time to broach the subject. </p>")
    n12.user = us3
    n12.truth = false
    n12.constraint_num = 0
    n12.truth_height = 1
    n12.story = ts5b
    n12.save(:validate => false)

    n13 = Node.new(:text => "<p>I squinted over at the clock and groaned. Sixteen more minutes before migration. It couldn&apos;t come soon enough. This time, the habitation had ended with a raucous New Year&apos;s party that lasted almost three days- starting from the obligatory gathering on December 31st, and lasting through New Year&apos;s Day, Then the next, and on into the wee hours of this morning. Say what you want, but steel workers can party. Shedding this body also meant shedding this hangover, and that wasn&apos;t a bad thing. Whoever moves in here is off to a rough start, I suppose, but nothing that can&apos;t be dealt with. Switchers are a resilient bunch.</p>

<p>I&apos;ve been switching since birth. I don&apos;t know how many of us there are, but I know I&apos;m not the only one. Instinctively, we know who the others are when we see them, and we know not to tell the &quot;statics&quot; about what we are. It&apos;s something you are born with, or are not. Every year, you switch. You become someone else. Generally, the body you switch to is roughly the same age as you are chronologically, but that seems to be the only rule. My first four in a row were boys, then with the fifth one, I was introduced to a whole new set of plumbing. I have been white, black, asian, fat, skinny, a parapalegic, and pregnant twice, given birth once. I have been hosted in nineteen different countries in twenty seven years. I quit speculating on what&apos;s in store for me years ago.</p>

<p>The odd thing is, you bring your own memories with you, and acquire the memories of the host...which is, I suppose, pretty handy. You switch in to a new life, and know what you need to know to get by, for the most part. As a five year old, I knew that my mommy was named Karen, Dad was Steve, and I had three older brothers, one of whom picked on me a lot. As a nineteen year old, My boyfriend was Kevin, and I emerged with the same affection for him as my predecessor did, even though my previous switch had been as a junior college pitcher in Wisconsin.</p>

<p>This past year has been pretty interesting. I&apos;m currently a steel worker in Buffalo, New York, and have been gainfully employed for the past year. The year before that, I was a waitress in a tiki bar in Key West. Before that, a car salesman in Chicago, and before that, a floor trader at the New York Stock exchange. I&apos;ve been a surgical resident, a point guard in the Italian version of the NBA, and a stay at home mom. I spent a year as a heroin addict that ended up with me in county jail.
Would I be a male? Female? American? (That year as a Syrian Rebel kinda sucked, by the way.) I didn&apos;t know, and I didn&apos;t speculate. I only knew I&apos;d be roughly 27 years old, give or take.</p>
")
    n13.user = us3
    n13.truth = false
    n13.constraint_num = 0
    n13.truth_height = 1
    n13.story = ts6a
    n13.save(:validate => false)

    n14 = Node.new(:text => "<p>I squinted over at the clock and groaned. Sixteen more minutes before migration. It couldn&apos;t come soon enough. This time, the habitation had ended with a raucous New Year&apos;s party that lasted almost three days- starting from the obligatory gathering on December 31st, and lasting through New Year&apos;s Day, Then the next, and on into the wee hours of this morning. Say what you want, but steel workers can party. Shedding this body also meant shedding this hangover, and that wasn&apos;t a bad thing. Whoever moves in here is off to a rough start, I suppose, but nothing that can&apos;t be dealt with. Switchers are a resilient bunch.</p>

<p>I&apos;ve been switching since birth. I don&apos;t know how many of us there are, but I know I&apos;m not the only one. Instinctively, we know who the others are when we see them, and we know not to tell the &quot;statics&quot; about what we are. It&apos;s something you are born with, or are not. Every year, you switch. You become someone else. Generally, the body you switch to is roughly the same age as you are chronologically, but that seems to be the only rule. My first four in a row were boys, then with the fifth one, I was introduced to a whole new set of plumbing. I have been white, black, asian, fat, skinny, a parapalegic, and pregnant twice, given birth once. I have been hosted in nineteen different countries in twenty seven years. I quit speculating on what&apos;s in store for me years ago.</p>

<p>The odd thing is, you bring your own memories with you, and acquire the memories of the host...which is, I suppose, pretty handy. You switch in to a new life, and know what you need to know to get by, for the most part. As a five year old, I knew that my mommy was named Karen, Dad was Steve, and I had three older brothers, one of whom picked on me a lot. As a nineteen year old, My boyfriend was Kevin, and I emerged with the same affection for him as my predecessor did, even though my previous switch had been as a junior college pitcher in Wisconsin.</p>

<p>This past year has been pretty interesting. I&apos;m currently a steel worker in Buffalo, New York, and have been gainfully employed for the past year. The year before that, I was a waitress in a tiki bar in Key West. Before that, a car salesman in Chicago, and before that, a floor trader at the New York Stock exchange. I&apos;ve been a surgical resident, a point guard in the Italian version of the NBA, and a stay at home mom. I spent a year as a heroin addict that ended up with me in county jail.
Would I be a male? Female? American? (That year as a Syrian Rebel kinda sucked, by the way.) I didn&apos;t know, and I didn&apos;t speculate. I only knew I&apos;d be roughly 27 years old, give or take.</p>
")
    n14.user = us3
    n14.truth = false
    n14.constraint_num = 0
    n14.truth_height = 1
    n14.story = ts6b
    n14.save(:validate => false)


    l1 = Link.new(:story_id => 9, :source => 9, :target => 11)
    l1.save(:validate => false)

    l2 = Link.new(:story_id => 10, :source => 10, :target => 12)
    l2.save(:validate => false)

    c1 = Constraint.new(:story_id => 1, :title => "Bandaid", :text => "The Ministry attempts to rectify the problem by Obliviating the muggles involved. ", :constraint_num => 0 )
    c1.save

    c2 = Constraint.new(:story_id => 1, :title => "The Storm", :text => "News spreads around the world, and several countries declare wizards a menace." , :constraint_num => 1 )
    c2.save

    c3 = Constraint.new(:story_id => 1, :title => "Family Ties", :text => "Hermione is put in a situation in which she must decide: save her family? Or the wizards?", :constraint_num =>2 )
    c3.save

    c4 = Constraint.new(:story_id => 1, :title => "Allegiances", :text => "&apos;Harry, muggles abused you as a child. How can you support them now? Why do you protect them?&apos;", :constraint_num =>3 )
    c4.save

    c5 = Constraint.new(:story_id => 1, :title => "Taken", :text => "Hermione strained against her shackles. She wondered if there was anyone left who would come for her.", :constraint_num =>4 )
    c5.save

    c21 = Constraint.new(:story_id => 3, :title => "Going Away", :text => "Jess is moving his things into the car, getting ready to go to college. His mom whispers to him.", :constraint_num => 0 )
    c21.save

    c22 = Constraint.new(:story_id => 3, :title => "Suspicions", :text => "Something at work makes Jess suspect that he may need the help of the bow soon.", :constraint_num => 1 )
    c22.save

    c23 = Constraint.new(:story_id => 3, :title => "Strike", :text => "It&apos;s been eight years since the day of the carnival. An arrow strikes his girlfriend&apos;s heart, just as she says &quot;I do&quot;.", :constraint_num =>2 )
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


    c41 = Constraint.new(:story_id => 7, :title => "The Decision", :text => "Lee and Jamie must decide: either participate or go bankrupt and surrender their son to the government", :constraint_num => 0 )
    c41.save

    c42 = Constraint.new(:story_id => 7, :title => "Small Favors", :text => "What a delicious fruit. Jamie had never tasted anything so sweet and so cold.", :constraint_num => 1 )
    c42.save

    c43 = Constraint.new(:story_id => 7, :title => "Hidden Surprises", :text => "Behind the brush, a camel stirs. Is it a menace? Or a friend?", :constraint_num =>2 )
    c43.save

    c44 = Constraint.new(:story_id => 7, :title => "Rifts", :text => "Relationship problems. Somehow Lee and Jamie must discover and overcome them.", :constraint_num =>3 )
    c44.save

    c45 = Constraint.new(:story_id => 7, :title => "Destinations", :text => " Lee and Jamie are on the lam(b)", :constraint_num =>4 )
    c45.save


    c51 = Constraint.new(:story_id => 9, :title => "Move-in", :text => "Charlie hangs a Bruce Springsteen poster in Emily&apos;s room, then puts a toothbrush in the restroom, clothes in the closet...", :constraint_num => 0 )
    c51.save

    c52 = Constraint.new(:story_id => 9, :title => "Push; Shove", :text => "Over dinner, Emily tells Charlie that she&apos;s moving to Brooklyn. She is lying.", :constraint_num => 1 )
    c52.save

    c53 = Constraint.new(:story_id => 9, :title => "Conflict of Interest", :text => "Emily discovers that Charlie is actually her elusive, rarely-seen boss.", :constraint_num =>2 )
    c53.save

    c54 = Constraint.new(:story_id => 9, :title => "Go For It", :text => "If Emily and Charlie aren&apos;t together, one of them goes for it. If they are, one of them goes for the urge to kiss another", :constraint_num =>3 )
    c54.save

    c55 = Constraint.new(:story_id => 9, :title => "Removal", :text => "Emily removes the Bruce Springsteen poster from her wall.", :constraint_num =>4 )
    c55.save


    c61 = Constraint.new(:story_id => 11, :title => "Baggage", :text => "Wow. I&apos;d never had to deal with this sort of baggage before.", :constraint_num => 0 )
    c61.save

    c62 = Constraint.new(:story_id => 11, :title => "Intuition", :text => "She smiled a winning smile. I was immediately drawn to her, but intuition and 27 people&apos;s experiences warned me to hold back.", :constraint_num => 1 )
    c62.save

    c63 = Constraint.new(:story_id => 11, :title => "Danger/Luck", :text => "Thank god. The gun had misfired.", :constraint_num =>2 )
    c63.save

    c64 = Constraint.new(:story_id => 11, :title => "Back Again", :text => "I never thought I&apos;d be back here, in this hellhole. But here I was, and I needed to make a plan.", :constraint_num =>3 )
    c64.save

    c65 = Constraint.new(:story_id => 11, :title => "Truth", :text => "I&apos;d never questioned *why* I was the way I was, but now the truth, unbidden, had revealed itself to me.", :constraint_num =>4 )
    c65.save

  end

  def down
  	Story.delete_all
  	Node.delete_all
  end
end
