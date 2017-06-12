# finalproject2
# apcs2 final project... i guess
UPDATE, JUNE 8: We haven't been updating this README because our commit logging is documented in our commit messages. Please see those for a detailed map of update stages. 

June 8:
-DANIEL: Added new movement controls for enemies. Squares now properly detect their distance from the goal with a breadth-first search. However, placing a tower in the immediate path of an enemy will not prevent the enemy from going through the tower's square, even though it SHOULD be blocked off. I'll ask about it in class tomorrow, but I can't see a possible fix.
June 9-10:
-DANIEL: Attempted to implement projectiles. There is a single commit for the entire release, as I tried to work on them for days without satisfactory success. See my commit message in my branch to see the progress that I made. As I said there, I will likely scrap this, because the loops cause too much lag.

Continued Development:
–STEVEN: Added everything of and related to towers, money, and that sidebar that you see on the, well, side. Not many commits because of the top-down nature of these kind of tasks. But they’re all done and working, so, yay!

June 11:
–STEVEN: Fixed a boatload of merge conflicts and fixed Daniel’s map, square, enemy, and projectile code to work with the sidebar, towers, and money.
–DANIEL: Fixed as many bugs as possible and created the final version (fixed loss message, fixed upgrades not applying to individual towers, repositioning things, fixed tower placement, fixed sidebar text overwrite bug, and too many other things that I can think of).

Welcome to Desktop National Defense! In our clone of Desktop Tower Defense, you defend your… red box from the enemy… red box. Yeah. It’s a shame that there is no real reference to those evil Communists like we planned. There are no graphics in this game besides ellipses and shapes. But that’s okay (I hope), because we have an algorithmically complex project with so many nuances that your brain will explode! (I know mine did).
Featuring enemies that detect their own (shortest) path to the goal AUTOMATICALLY, freely placeable and upgradable towers, and a NEXT-LEVEL SCORE AND MONEY SYSTEM (okay, fine, they’re just basic counters, whatever), Desktop National Defense offers unmatched replayability and exciting, action-packed gameplay that no other game on the PC market surpasses!

In order to play, click on the blue square on the sidebar in order to tell the program that you’d like to place a tower, and click on any square on the map in order to place your tower there. Towers cost $25. If you’d like to upgrade your tower sometime later, click on your tower and then click on the wider, thinner rectangle that pops up on the “more info” part of the sidebar. Towers have four upgrade stages: each successive upgrade stage deals one extra point of damage (unupgraded towers deal 1 damage, one upgrade makes 2 damage, etc., until 4) and increases the tower’s range significantly.
Enemies will automatically detect the shortest distance to the goal, the other red square on the other side of the map. Each time an enemy reaches the goal, it will take away one life of yours for every health point it has! (So for example, an enemy with one health point left will take away one life, etc.) You might say, “I want to KEEP my lives! Don’t take them, you filthy enemy scum!” How do you stop them?
The answer: use a gun (or a tower). And if that don’t work, use more gun (once again, more tower). References also help, sometimes.
You gain 10 points for every single damage point your towers deal. The game ends when all of your 100 lives are lost, so make sure to stay healthy and lively!

But like any great game, we do have a few… minor bugs, and there are some features that we planned on implementing at the beginning of the final project period that we never got to. These are listed here:

–You can’t sell towers. It’s like hardcore mode. You place a tower, it’s there forever. There’s no demolitions crew. Sorry, deal with it.
–There’s only one difficulty: insanely hard. If you wanted more than 100 lives or slower moving enemies, too bad. Like I said, deal with it.
–There’s only one type of enemy, really. Each wave spawns enemies with one more health point and one extra speed point. This game gets real hard real fast. Don’t expect to survive long.
–The only way to tell whether you’ve selected a tower or not is if you see a tower icon at the top left of the window. Kind of uncomfortable, yeah, but oh well.
–The game won’t tell you this, but it won’t let you place a tower above the enemies’ start, below the enemies’ end, or on the same column of squares as the enemies’ start. Towers are useless there. Trust me, it’s for your own good.
–The only variation between towers are upgrades, or in other words, increased damage and range. Nothing too special, really.
–The projectiles aren’t really projectiles. They look like frog tongues trying to catch flies. It’s pretty stupid, but somehow funny at the same time.
–There’s no Cold War theme here. I’m just as disappointed as you are, believe me.
–Did I mention that there are no graphics beyond basic shapes in this game?

But these are just minor flaws. Remember the key to success in Desktop National Defense: have fun!

