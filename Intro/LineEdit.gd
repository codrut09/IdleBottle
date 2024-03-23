extends LineEdit

func _ready():
	# Setează un text de placeholder pentru a indica utilizatorului să introducă numele companiei
	placeholder_text = "Introdu numele companiei tale de apă"

func _on_text_entered(new_text: String):
	# Această funcție este apelată atunci când utilizatorul apasă Enter după ce a introdus text
	var company_name = new_text
	print("Numele companiei de apă este: ", company_name)
	# Aici poți face orice altceva cu numele companiei introdus
