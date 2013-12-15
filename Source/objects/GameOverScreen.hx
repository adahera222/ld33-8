package objects;

import flash.events.KeyboardEvent;

/**
 * Game Over Screen
 * Screen shown when the game is lost.
 * @author armornick
 */
class GameOverScreen extends Screen
{

	public function new(id) 
	{
		super(id);
		this.background = ResourceManager.getBitmap("gameover.png");
	}
	
	public override function onKeyDown (event:KeyboardEvent)
	{
		if (_onFinish != null)	_onFinish();
	}
	
}