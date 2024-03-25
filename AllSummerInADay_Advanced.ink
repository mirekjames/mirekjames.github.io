//Retelling All Summer in a Day
//Mirek Stolee
//original story by Ray Bradbury

//defining a variable called Bully Level and setting its initial value to 0
VAR BullyLevel = 0

//Starting text, then diverts into the first knot.
"William, could you share your poem to the class?"
-> Poem

=== Poem ===
//two choices without branching. Choices without [] are typed out after you choose them.
* "The sun is a star." -> Poem2
* "The sun gives us light." -> Poem2

=== Poem2 ===
//this knot has text that appears after each choice.
* "They say it's very far."
    "Thank you, William. Margot, how about you?"
     -> MargotPoem
     
* "They say it's warm and bright."
    "Thank you, William. Margot, how about you?"
     -> MargotPoem
     

=== MargotPoem ===
//only one choice

Margot begins quietly.

//HTML syntax for italics
<i>I think the sun is a flower</i>
<i>That blooms for just one hour.</i>

* "Aw, you didn't write that!"
    //increase BullyLevel by 1
    ~ BullyLevel = BullyLevel + 1
    "I did," said Margot. "<i>I did.</i>" 
    -> Reaction
    
=== Reaction ===
//this knot has text that appears after each choice.
* You believe her.
    Margot knows about the sun. Unlike you and the rest of the students, she was born on Earth. You hate it for it.
    
    Last month, she closed her eyes and said "It's like a fire in the stove."
    -> Window
* You don't believe her.
    Margot is stupid. Who cares if she was born on Earth. She was two! 
    
    Last month, she said the sun was like a penny. But <i>everyone</i> knows it's round. She's not special.
    -> Window
    
=== Window ===
You blurt out. "What're <i>you</i> looking at?"

//increase BullyLevel by 1
    ~ BullyLevel = BullyLevel + 1

Margot continues to stare out the window. She doesn't respond.

*"Speak when you're spoken to."
Why doesn't she just act normal? You remember when last month when she wouldn't even shower at the school. She screamed when the water rained down on her.
-> Today

//choices with [] are not typed out after you click them.
*[You say nothing.]
You stare at her pale face. 
-> Today

=== Today ===
"It's today. The scientists predict, you know... the sun." Her voice wavers softly. 

Another boy cries out. "Nothing! It was all a joke, wasn't it?" He turns to you and the others. "Nothing's happening today. Is it?"

* You laugh. "Right, it's all a joke!"
//increase BullyLevel by 1
    ~ BullyLevel = BullyLevel + 1
The rest of the class follows suit. "Nothing, nothing!"
-> Suggestion

* "No, the sun's coming up today."
The other boy glares at you. Did you say something wrong?
-> Suggestion

=== Suggestion ===
"Hey everyone, let's put her in a closet before teacher comes!" the boy says.

//text that displays only if BullyLevel is 3 or higher
{BullyLevel >= 3: "Let's get her!" you reply.}

* [You grab her.]
-> Closet
* [You block her escape.]
-> Block

=== Closet ===
Margot protests. She pleads. She cries. But you and the others carry her down a tunnel into a closet. And when you shut the door on her, it trembles with her pounding. You smile.
    //increase BullyLevel by 2
    ~ BullyLevel = BullyLevel + 2
-> Ready

=== Block ===
Margot turns to run to the teacher, she can't get past you in the narrow passage. The others take her and shove her into a closet down a tunnel. You can't bear to watch.
    //increase BullyLevel by 1
    ~ BullyLevel = BullyLevel + 1
-> Ready

=== Ready ===
"Ready, children?" The teacher calls out as you walk down the tunnel. The torrent of raindrops slamming the glass walls of the tunnel are as loud as always. Then, their tempo slows down. A natural ritardando. 

The rain stops. The door opens.

    -> RainStops
    
=== RainStops ===
//example of a looping knot. * choices can only be chosen once. If they were + choices, you could choose the same option again.

//Once-only. Shows "You notice:" only the first time the knot is seen.
{!You notice:}

* The silence.
    It's deafening.
    -> RainStops
* The warmth.
    It's nice.
    -> RainStops
*The landscape.
    It's beautiful.
    -> RainStops
//this is a fallback choice - it will automatically be chosen if there are no other options left i.e. they've clicked all three.
*   ->
    You rush outside.
    -> Play
    

=== Play ===
//another looping knot, but you can only do two out of three options.

//sequence
{    "Now, don't go too far," calls your teacher. "You've only two hours, you know. You wouldn't want to get caught out!" | You can barely hear your teacher's voice. "Just an hour left!"}

//conditional: only show this choice if the player hasn't chosen the other two already. They haven't seen BOTH the  "HideAndSeek" and "Run" knots.
* { not (HideAndSeek and Run) } [Rush into the jungle.]
-> Jungle

//conditional: only show this choice if the player hasn't chosen the other two already. They haven't seen BOTH the  "Jungle" and "Run" knots.
* { not (Jungle and Run) } [Play hide-and-seek.]
-> HideAndSeek

//conditional: only show this choice if the player hasn't chosen the other two already.
* { not (Jungle and HideAndSeek) } [Run and shout for joy.]
-> Run

//conditional: show this choice only if the player has chosen any 2 of the above 3 choices.
* { (Jungle && HideAndSeek) || (Jungle && Run) || (HideAndSeek && Run)} [And then...] 
->  Rain

=== Jungle ===
The warm daylight filters through the canopy, dotting the gray flora with splatters of light. You and the others dart between the trees and leap over exposed roots that grow before your eyes. The plants are intertangled octopi, tentacles waving gently toward the sun.
+ [What next?]
-> Play

=== HideAndSeek ===
It's hard to control your laughter as you sprint away and slip behind one of the trees. It's even harder to be upset when you're found. You and the others raise your hands toward the yellow sun and the bluest sky you've ever seen. 
-> Play

=== Run ===
You and some of the others run wildly, squealing with delight. Your shouts fade away into the silence. You run and run for an hour.
-> Play


=== Rain ===
One of the girls wails, holding out her hand. "Look," she says. You peer into her cupped palm and see the raindrop shimmer with her trembling. You begin to cry as the rhythm of the rain accelerates to a roar. You look up, and see only mist. You count the seconds between thunder and lightning. The storm is approaching, and the sky is dark as midnight.

* [You go inside.]
-> Inside

=== Inside ===
The pounding of the droplets flood your ears. It's already hard to remember the quiet of the sunlight. 

"Seven more years?"
"Yes. Seven."

* [Someone suddenly whispers.] 
->Margot

=== Margot ===
"Margot! She's still in the closet where we locked her."

Your feet feel welded to the floor. You watch as the others stare in different directions, then down at their shoes.

"Margot."

One of the girls speaks over the dull sound of the downpour. "Well... ?"

No one moves.

Then others start to trickle slowly down toward the closet.

* You follow.
-> LetOut
* You can't.
-> Stay

=== LetOut ===
//check how high BullyLevel is
{BullyLevel > 4: You led the class to do this. }
{BullyLevel < 1: It's horrible that your classmates did this. You have to make it right.}

//conditionals: If player saw the knot "Closet", it shows the first chunk of text. If they saw the knot "Block", it shows the second line.
{Closet: You put her in there. You should be the one to let her out.}
{Block: She could have gone to the teacher if you hadn't stopped her. But is all this really your fault?}

Blue lightning illuminates the dark hallway in flashes as you slowly approach. You stand by the door, and hear nothing from beyond it.

You unlock the door and let Margot out.
-> END

=== Stay ===
//conditionals: If player saw the knot "Closet", it shows the first chunk of text. If they saw the knot "Block", it shows the second line.
{Closet: The sound of her pounding on the closet door rings in your head.}
{Block: Seven years.}

Your classmates stream down the tunnel, but you remain planted. 

The rain will fall, everywhere and forever.
-> END

    