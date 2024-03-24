extends Control

var Money = GlobalVariables.money

# Called when the node enters the scene tree for the first time.
func _ready():
	$Money.text = "$" + str(Money)
	


func _on_main_pressed():
	get_tree().change_scene_to_file("res://Main/Main.tscn")


func _on_buy_bottle_500_pressed():
	if not GlobalVariables.bottleSize500 and Money >= 1000:
		GlobalVariables.bottleSize500 = true
		Money -= 1000
		$Money.text = "$" + str(Money)

func _on_buy_bottle_1000_pressed():
	if not GlobalVariables.bottleSize1000 and Money >= 1000:
		GlobalVariables.bottleSize1000 = true
		Money -= 2000
		$Money.text = "$" + str(Money)


func _on_buy_bottle_1500_pressed():
	if not GlobalVariables.bottleSize1500 and Money >= 1000:
		GlobalVariables.bottleSize1500 = true
		Money -= 5000
		$Money.text = "$" + str(Money)


func _on_buy_bottle_2000_pressed():
	if not GlobalVariables.bottleSize2000 and Money >= 1000:
		GlobalVariables.bottleSize2000 = true
		Money -= 10000
		$Money.text = "$" + str(Money)
