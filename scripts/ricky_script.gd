extends Node

#NOTE: MECHANIC IDEA - "HOLDING HANDS", 20/06/2025 - APPROX. 15:00
#When two players are within range of each other, and those ranges overlap, if each player presses and holds 
#a specific button (circle/A/whatever XBOX uses, is it B?), the two players will display new sprites, be able
#to move together (based on whomever provides input first, perhaps?) and be shown HOLDING HANDS.

#Moving together will require active communication between the players, as there shouldn't be a visual indicator 
#for whose inputs the characters are following. This should on some occasions be difficult, because communication
#with others can be difficult. But this should also be necessary for overall success.
# -> An early tutorial level could be "WE GET ALONG", which simply requires two players to hold hands, as a
# demonstration of the mechanic.

#Use of the mechanic should not be mandatory for ALL levels, but should ALWAYS benefit the players (or at least
#provide some sort of alternative outcome if players make this work.
#<END NOTE>


#NOTE: MECHANIC IDEA - COLLECTING/TOUCHING A THING TO WIN A LEVEL, 29/06/2025 - 17:50
#An object sits in a level, and must be touched by both players at the same time to create the level's Win 
#Condition. When either player enters the collision area of the object, a variable called PLAYER_X_WIN is set 
#to TRUE. When both players do this, a third variable called LEVEL_WIN_CONDITION is set to TRUE. Once this
#occurs, this triggers a function called LEVEL_WIN.
#<END NOTE>

#IN LEVEL SCRIPT

@onready var player_left: CharacterBody2D = $PlayerLeft
@onready var player_right: CharacterBody2D = $PlayerRight
@onready var test_macguffin: Area2D = $test_macguffin
#NOTE: DO YOU NEED THESE? I DON'T THINK YOU NEED THESE?!?
@onready var countdown_timer: CanvasLayer = $UI/CountdownTimer #NOTE: THIS ONE YOU NEED
@onready var level_win_screen: CanvasLayer = $UI/LevelWin
@onready var restart_button: Button = $UI/LevelWin/VBoxContainer/restart_button

var player_left_win = false
var player_right_win = false
var win_condition = false #I KNOW YOU SAID LEVEL_WIN_CONDITION ABOVE BUT WHATEVER.

func _process(delta: float) -> void:
	if player_left_win and player_left_win:
		win_condition = true
	
	if win_condition:
		countdown_timer.stop_timer()
		countdown_timer.queue_free()
		await get_tree().create_timer(0.25).timeout
		level_win_screen.show()
		restart_button.grab_focus()
		

func _on_test_macguffin_body_entered(body: Node2D) -> void:
	if body == player_left:
		player_left_win = true
	if body == player_right:
		player_right_win = true
		
#YOU THEN NEED AN BODY EXIT CONDITION


# NOTE: LEVEL IDEA: WE'LL SHARE SILENCE (ORIGINALLY WRITTEN 30+31/07/2025)

#The two players appear on screen. They are in a white void. 
#All they have to so is remain still. If they do this for three seconds, they solve the level.
#Everything the player does creates sound - jumping, walking, pressing the action button. 
#Even holding hands emits an "Awww" in the background. The point is to simply remain still. 
# - - (or perhaps, if holding hands, the timer only ticks down after the "Awww" sound stops playing).


#NOTE: TUTORIAL PROMPT ON "WE SHARE SILENCE"
#IF/ELSE CHECK EVERY THREE SECONDS FOR A CONDITION CALLED TUTORIAL_SHOW?

#NOTE: CONCEPT FOR CHECKING LEVEL AND AS SUCH PLAYING CORRECT ANIMATION IN "WE'LL SHARE SILENCE"
#WITHIN PLAYER IDLE FUNCTION
#FUNC LEVEL_CHECK
#CURRENT SCENE = GET CURRENT SCENE FILE
#IF CURRENT SCENE = WE'LL SHARE SILENCE
# 

# NOTE: A GLOBAL TO LOAD A CREDITS SCREEN
# When the win condition on level 3 occurs, set a global for the menu to true.
# This global, if true, displays the credits screen - script you'll need to add in the main menu script.
# Clicking the Main Menu or Feedback button in the credits menu turns the global to false.
