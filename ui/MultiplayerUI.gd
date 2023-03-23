extends Control

# messages are unsafe lol
class Message:
	var sender : String
	var message : String
	
	func _init(_sender : String, _message : String):
		sender = _sender
		message = _message
	
	func format_message() -> String:
		return "[" + sender + "]: " + message

var message_history : Array = []
var username = "User"

# Called when the node enters the scene tree for the first time.
func _ready():
	$"%UsernamePopup".popup()

func update_text_box():
	$"%TextOutput".text = ""
	
	for message in message_history:
		$"%TextOutput".text += message.format_message() + "\n"


func _on_TextInput_text_entered(new_text : String):
	message_history.append(Message.new(username, new_text))
	$"%TextInput".clear()
	update_text_box()

func _handle_username_input(new_username : String):
	# Should check that usernames are one character or greater, but I honestly don't really care
	username = new_username
	$"%UsernamePopup".hide()
	$"%TextInput".grab_focus()

func _on_UsernameInput_text_entered(new_text : String):
	_handle_username_input(new_text)

func _on_SubmitButton_pressed():
	_handle_username_input($"%UsernameInput".text)

func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://ui/MainMenu.tscn")
