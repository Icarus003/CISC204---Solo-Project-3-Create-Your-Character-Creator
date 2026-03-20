extends Node2D

var heads = [
	"head1",
	"head2",
	"head3",
	"head4",
	"head5"
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

var current_heads_index: int = 0
var current_torsos_index: int = 0
var current_legs_index: int = 0

# Functions 
func change_index_forward():
	if current_index <= 4:
		current_index += 1
	else:
		current_index = 0

func change_index_back():
	if current_index <= 0:
		current_index -= 1
	else:
		current_index = 4

func change_head():
	pass

func change_torso():
	pass

func change_legs():
	pass


# Functions for buttons
func _on_hair_back_pressed():
	change_index_back()

func _on_hair_forward_pressed():
	change_index_forward()

func _on_torso_back_pressed():
	change_index_back()

func _on_torso_forward_pressed():
	change_index_forward()

func _on_legs_back_pressed():
	change_index_back()

func _on_legs_forward_pressed():
	change_index_forward()
