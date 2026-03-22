extends Node2D

# Character attribute arrays
var heads = [
]

var torsos = [
	"torso1",
	"torso2",
	"torso3",
	"torso4",
	"torso5"
]

var legs = [
	"leg1",
	"leg2",
	"leg3",
	"leg4",
	"leg5"
]

# Current index for arrays
var current_heads_index: int = 0
var current_torsos_index: int = 0
var current_legs_index: int = 0

func _ready():
	heads = [$Heads/Head1,$Heads/Head2,$Heads/Head3,$Heads/Head4,$Heads/Head5]
	update_arrays()

# Sets the initial visibility state for the character creator
func update_arrays():
	for h in heads:
		h.visible = false
	#for t in torsos:
	#	t.visible = false
	#for l in legs:
	#	l.visible = false
	
	heads[current_heads_index].visible = true
	#torsos[current_torsos_index].visbile = true
	#legs[current_legs_index].visible = true

# Changes current index forward & back
func change_index_forward(current_index):
	if current_index <= 3:
		current_index += 1
	else:
		current_index = 0
	return current_index

func change_index_back(current_index):
	if current_index >= 1:
		current_index -= 1
	else:
		current_index = 4
	return current_index


# Allows buttons to change current index forward & back
func _on_hair_back_pressed():
	change_index_back(current_heads_index)
	current_heads_index = change_index_back(current_heads_index)
	update_arrays()
	print(current_heads_index)

func _on_hair_forward_pressed():
	change_index_forward(current_heads_index)
	current_heads_index = change_index_forward(current_heads_index)
	update_arrays()
	print(current_heads_index)

func _on_torso_back_pressed():
	change_index_back(current_torsos_index)
	current_torsos_index = change_index_back(current_torsos_index)

func _on_torso_forward_pressed():
	change_index_forward(current_torsos_index)
	current_torsos_index = change_index_forward(current_torsos_index)

func _on_legs_back_pressed():
	change_index_back(current_legs_index)
	current_legs_index = change_index_back(current_legs_index)

func _on_legs_forward_pressed():
	change_index_forward(current_legs_index)
	current_legs_index = change_index_forward(current_legs_index)
