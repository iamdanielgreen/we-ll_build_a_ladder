# To-Do List

- Adjust levelEnd for a quicker solve. (Added 05/08/2025)
- DESIGN NOTE: Should the level be titled "We share a moment of silence"? ~~The tutorial prompt for this level could denote how long said moment is. (Added 05/08/2025)~~ (Tutorial Prompt now says "Something will come from 'Nothing'" - 20/08/2025)
~~- Add the dang button that moves to next level. Even if the final game doesn't need it. (Added 05/08/2025)~~ (Fully implemented in Test Build 02 - 20/08/2025)
~~- Add a timer-free mode? (Added 05/08/2025)~~ (Priority is now to make the game timer-free generally, but it's an interesting thought exercise to have the version *with* the timer be the extra option. - 20/08/2025)

- Levels end with a clapping noise when solved. (Added 06/08/2025)
- - [As of 20/08/2025] Clapping sounds recorded. Not yet implemented.
- - - [31/08/2025 - Test version implemented within "We'll Take Action"/Test Build Three, Level 3]

~~- Check references + onreadys as these may have changed when moving Test Build files into a new folder (Added 08/08/2025)~~ (As a result of a build based on new levels existing, I think this is resolved - 20/08/2025)
~~- - Create new scripts/update script names for test_build_levels (Added 08/08/205)~~
~~- You still haven't fixed the tutorial text clearing issue on "We'll Jump For Joy" (Added 08/08/2025)~~ (I *think* I have now? - 09/08/2025)
~~- Have grab_focus direct to Next Level button (Added 08/08/2025)~~
~~- - Tried to make this work, but it's not happening for some reason.~~ (Decided this wasn't necessary, and never quite worked the way I wanted it to anyway - 20/08/2025)
~~- Remove Next Level button at game end (Added 08/08/2025)~~
~~- - OR: Create scene asking for feedback (Added 08/08/2025)~~ (Feedback Screen added to Test Build 02 - Next Level button directs to Credits Screen at game's end - 20/08/2025)
- Add a controls page (Added 08/08/2025)

- It's possible for the pause menu to load when level_win_menu is visible. Can we block this? (Added 11/08/2025)
- Remember you're going to need to import sprites in the direction you want them to face. (Well, sure, but this isn't *that hard* to fix.) (Added 11/08/2025)
~~- Hide Quit Button for Itch.io build. (Added ??)~~ (Implemented in Test Build 02 - 20/08/2025)
~~- Fix size of window for fullscreen mode.~~ (Implemented in Test Build 02 - 20/08/2025)
~~- Add a means of enabling feedback button (show())~~ (Heck that, we disabled it.) (Implemented in Test Build 02 - 20/08/2025)

- You need icons/pictograms that convey the activities players will do in each of the level types. (Added 18/08/2025)
- - Movement
- - Action 
- - Hand holding (hand shake)
- - Nothing? (stop sign?)
~~- Check Brackeys tutorial about jumping through platforms in a one-way fashion (for "We'll Climb a Tree") (Added 18/08/2025)~~ [06/09/2025, 17:45 - You did this at some point over the last week. You set a CollisionShape2D to have One Way Collison. You tick a box. That's it.]

~~- Disable timer (Added 20/08/2025)~~ (Ability to remove timer possible since 29/08/2025)
~~- Implement final bits of tutorial text (Added 20/08/2025)~~ (Implemented as of 27/08/2025)
~~- - Move~~ (Properly implemented as of 24/08/2025)
~~- - Action~~ (Properly implemented as of 27/08/2025)

- Make concept art based on the notebook drawings. (Added 20/08/2025)
- Complete the Scene Manager Tutorial. (Added 20/08/2025)

- In "We'll Take Action" as a placeholder have the action button trigger a state change to purple cats. (Added 25/08/2025)
~~- Add world boundaries to levels. (Added 25/08/2025)~~ [Implemented as of 28/08/2025]

- Revise keyboard controls so that Player Left and Right can navigate the Main Menu. (Added 29/08/2025)
~~- Add "Yeah Sound" to all button inputs on "We'll Share Silence" as placeholder (Added 29/08/2025)~~ [31/08/2025 - Not hugely necessary, prioritise new sounds instead.]
- Add additional menu screen to turn timer on or off. (Added 29/08/2025)
- Test Main Menu Button in "We'll Try Again" menu. (Added 29/08/2025)

- Update credits (Added 31/08/2025)

- Change "We Have Succeeded" text to black (for certain levels). (Added 01/09/2025)

- Work out how to deal with the "action-walk" in "We'll Share Silence" will require playing two sounds, and you don't necessarily want this to loop. (Added 06/09/2025)
- - You have notes in "ricky_script.gd" about this.

- "We'll Try Again" text label in "OutOfTime.tscn" needs outline, or to be set to black. (Added 06/09/2025)