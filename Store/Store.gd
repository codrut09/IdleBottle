extends Control

var Bottle500 = false
var Bottle1000 = false
var Bottle1500 = false
var Bottle2000 = false
var Money = GlobalVariables.money

# Called when the node enters the scene tree for the first time.
func _ready():
	$Money.text = "$" + str(Money)
	


func _on_buy_bottle_500_pressed():
	if not Bottle500 and Money >= 1000:
		Bottle500 = true
		Money -= 1000
		$Money.text = "$" + str(Money)

func _on_main_pressed():
	get_tree().change_scene_to_file("res://Main/Main.tscn")
	

func transfer_data_between_scenes(old_scene, new_scene):
	old_scene.Bottle500 = new_scene.Bottle500
