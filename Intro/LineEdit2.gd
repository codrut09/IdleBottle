extends LineEdit

func _ready():
	# Setează un text de placeholder pentru a indica utilizatorului să introducă numele companiei
	placeholder_text = "Introdu numele"

func _on_text_entered(new_text: String):
	# Această funcție este apelată atunci când utilizatorul apasă Enter după ce a introdus text
	var company_name = new_text
	print("Numele: ", company_name)
	# Aici poți face orice altceva cu numele companiei introdus


func _on_button_pressed():
	pass # Replace with function body.
