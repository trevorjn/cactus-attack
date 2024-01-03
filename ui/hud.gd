extends CanvasLayer


var seconds_alive: float = 0:
	set(value):
		seconds_alive = value
		$SecondsAlive.text = str(snappedf(seconds_alive, 0.01))

var best_seconds_alive: float = 0:
	set(value):
		best_seconds_alive = value
		$BestSecondsAlive.text = str(snappedf(best_seconds_alive, 0.01))
