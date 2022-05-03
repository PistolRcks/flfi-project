extends PlayerEntity

# Called when the node enters the scene tree for the first time.
func _ready():
	# Numpad notation:
	# 7 8 9 UL U UR
	# 4 5 6 L  N R
	# 1 2 3 DL D DR

	# Attacks are A and B (G stands for both A and B). Notation is numpad notation (as described above)
	# Input combos higher to have more priority
	combo_list = [
		Combo.new("236.?A$", "Fireball", []),		# Quartercircle Forward + A (additional char for ease of input)
		Combo.new("65?23.?A$", "Dragon Punch", []),	# Z motion forward (optional neutral) + A (additional char for ease of input)
		Combo.new("G$", "Forward Grab", []),
		Combo.new("5A$", "Jab", [					# Just A (technically neutral A)
			{
				"damage" 	: 6,		# Damage to deal on hit
				"chip"		: 0,		# Damage to deal on block
				"hitstun" 	: 0.067,	# Amount of time to force inactivity on hit (in sec)
				"blockstun" : 0.016,	# Amount of time to force inactivity on block (in sec)
				"knockback" : 1,		# Force of knockback to deal on hit
				"location" 	: "MID"		# The location which the hitbox targets (HIGH, MID, LOW, or UNBLOCK (unblockable))
			}
		]),
		Combo.new("6A$", "lmao 6P reference", []),	# Forward + A
		Combo.new("2A$", "Dickpunch (yes that's really what it's called in Tekken)", []),	# Down + A (yes that is actually what it is called)
		Combo.new("5656$", "Forward Dash", []),		# Doubletap Forward
	]
	
	register_combos()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Return to neutral when an animation is finished (technically this should be attached to Entity but whatever)
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name != "neutral":
		print("RETURN TO NEUTRAL")
		return_to_neutral()
