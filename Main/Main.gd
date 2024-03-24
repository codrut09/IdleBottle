extends Control

var fillBottle = 0
var CounterBottle330 = 0
var InventoryBottle330 = 0
var TapWaterUpp = false
var TapWaterUppLvl = 1
var TapWaterIdleUppLvl = 1
var Money = GlobalVariables.money

var bottleSize500 = GlobalVariables.bottleSize500
var bottleSize1000 = GlobalVariables.bottleSize1000
var bottleSize1500 = GlobalVariables.bottleSize1500
var bottleSize2000 = GlobalVariables.bottleSize2000


func _ready():
	$LabelBottle330.text = str(fillBottle)
	$InventoryBottle330.text = str(InventoryBottle330)
	$Money.text = "$" + str(Money)
	$UppTapWater_lvl.text = str(TapWaterUppLvl)
	$UppTapWaterIdle_lvl.text = str(TapWaterIdleUppLvl)


func _on_tap_watter_pressed():
	var water_amount = TapWaterUppLvl * 10
	var total_water = fillBottle + water_amount
	if total_water >= GlobalVariables.currBottle:
		var bottles_filled = int(total_water / GlobalVariables.currBottle)
		var overflow = total_water % GlobalVariables.currBottle
		InventoryBottle330 += bottles_filled
		fillBottle = overflow
		$LabelBottle330.text = "0/330"
	else:
		fillBottle = total_water
	$LabelBottle330.text = str(fillBottle) + "/330"
	$InventoryBottle330.text = str(InventoryBottle330)


func _on_sell_pressed():
	var SoldValue = InventoryBottle330 * 1
	Money += SoldValue
	InventoryBottle330 = 0
	$InventoryBottle330.text = str(InventoryBottle330)
	$Money.text = "$" + str(Money)
	
	


func _on_timer_timeout():
	if TapWaterUpp:
		var water_amount = TapWaterIdleUppLvl * 10
		var total_water = fillBottle + water_amount
		if total_water >= 330:
			var bottles_filled = int(total_water / 330)
			var overflow = total_water % 330
			InventoryBottle330 += bottles_filled
			fillBottle = overflow
			$LabelBottle330.text = "0/330"
		else:
			fillBottle = total_water
		$LabelBottle330.text = str(fillBottle) + "/330"
		$InventoryBottle330.text = str(InventoryBottle330)
	


func _on_tap_water_idle_pressed():
	if not TapWaterUpp and Money >= 10:
		TapWaterUpp = true
		Money -= 10;
		$Money.text = "$" + str(Money)
	


func _on_upp_tap_water_pressed():
	var upgrade_price = TapWaterUppLvl * 5
	if Money >= upgrade_price:
		Money -= upgrade_price
		TapWaterUppLvl += 1
		$UppTapWater_lvl.text = str(TapWaterUppLvl)
		$Money.text = "$" + str(Money)
	


func _on_upp_tap_water_idle_pressed():
	var upgrade_price = TapWaterIdleUppLvl * 5
	if TapWaterUpp and Money >= upgrade_price:
		Money -= upgrade_price
		TapWaterIdleUppLvl += 1
		$Money.text = "$" + str(Money)
		$UppTapWaterIdle_lvl.text = str(TapWaterIdleUppLvl)


func _on_upp_tap_water_x_10_pressed():
	var upgrade_price = TapWaterUppLvl * 5 * 10
	if Money >= upgrade_price:
		Money -= upgrade_price
		TapWaterUppLvl += 10
		$UppTapWater_lvl.text = str(TapWaterUppLvl)
		$Money.text = "$" + str(Money)


func _on_upp_tap_water_idle_x_10_pressed():
	var upgrade_price = TapWaterIdleUppLvl * 5 * 10
	if TapWaterUpp and Money >= upgrade_price:
		Money -= upgrade_price
		TapWaterIdleUppLvl += 10
		$Money.text = "$" + str(Money)
		$UppTapWaterIdle_lvl.text = str(TapWaterIdleUppLvl)


func _on_store_pressed():
	get_tree().change_scene_to_file("res://Store/Store.tscn")
