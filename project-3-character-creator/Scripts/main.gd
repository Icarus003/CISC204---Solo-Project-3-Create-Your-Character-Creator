extends Node2D

# Customizable object arrays
var beds = [
]

var paintings = [
]

var rugs = [
]

# Current index for arrays
var current_beds_index: int = 0
var current_paintings_index: int = 0
var current_rugs_index: int = 0

var save_state = ''

func _ready():
	beds = [$RoomElements/Beds/BlueBed,$RoomElements/Beds/GreenBed,$RoomElements/Beds/OrangeBed,$RoomElements/Beds/PinkBed,$RoomElements/Beds/PurpleBed]
	paintings = [$RoomElements/Paintings/Painting01,$RoomElements/Paintings/Painting02,$RoomElements/Paintings/Painting03,$RoomElements/Paintings/Painting04,$RoomElements/Paintings/Painting05]
	rugs = [$RoomElements/Rugs/Rug01,$RoomElements/Rugs/Rug02,$RoomElements/Rugs/Rug03,$RoomElements/Rugs/Rug04,$RoomElements/Rugs/Rug05]
	update_arrays()

# Sets the initial visibility state for the room creator
func update_arrays():
	for b in beds:
		b.visible = false
	for p in paintings:
		p.visible = false
	for r in rugs:
		r.visible = false
	beds[current_beds_index].visible = true
	paintings[current_paintings_index].visible = true
	rugs[current_rugs_index].visible = true

# Functions that change current index forward & back
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


# Functions for buttons to change the current visible objects and changes the index for the arrays 
func _on_bed_back_button_pressed():
	change_index_back(current_beds_index)
	current_beds_index = change_index_back(current_beds_index)
	update_arrays()

func _on_bed_forward_button_pressed():
	change_index_forward(current_beds_index)
	current_beds_index = change_index_forward(current_beds_index)
	update_arrays()

func _on_painting_back_button_pressed():
	change_index_back(current_paintings_index)
	current_paintings_index = change_index_back(current_paintings_index)
	update_arrays()

func _on_painting_forward_button_pressed():
	change_index_forward(current_paintings_index)
	current_paintings_index = change_index_forward(current_paintings_index)
	update_arrays()

func _on_rug_back_button_pressed():
	change_index_back(current_rugs_index)
	current_rugs_index = change_index_back(current_rugs_index)
	update_arrays()


func _on_rug_forward_button_pressed():
	change_index_forward(current_rugs_index)
	current_rugs_index = change_index_forward(current_rugs_index)
	update_arrays()

#Saving function
func save():
	save_state = str(current_beds_index) + str(current_paintings_index) + str(current_rugs_index)
	print("saved: " + save_state)

# Load previous save function
func load_save():
	current_beds_index = int(save_state[0])
	current_paintings_index = int(save_state[1])
	current_rugs_index = int(save_state[2])
	print("Loaded: " + save_state)
	
# Saves current state when pressed
func _on_save_button_pressed() -> void:
	save()

# Loads state that was saved
func _on_load_button_pressed() -> void:
	load_save()
	update_arrays()
