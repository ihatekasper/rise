extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	update_activity()


func update_activity() -> void:
	var activity = Discord.Activity.new()
	activity.set_type(Discord.ActivityType.Playing)
	activity.set_details("in Deathmatch on Arcade")
	activity.set_state("8/2/4")

	var assets = activity.get_assets()
	assets.set_large_image("gameicon")
	assets.set_large_text("RISE")
	#assets.set_small_image("teampurple")
	#assets.set_small_text("Team Purple")

	var result = yield(Discord.activity_manager.update_activity(activity), "result").result
	if result != Discord.Result.Ok:
		push_error(result)
