package objects;

import flash.events.KeyboardEvent;

/**
 * Game Over Screen
 * Screen shown when the game is lost.
 * @author armornick
 */
class StoryScreen extends Screen
{

	public function new(id) 
	{
		super(id);
		this.background = ResourceManager.getBitmap("story_screen.png");
	}
	
	public override function onKeyDown (event:KeyboardEvent)
	{
		if (_onFinish != null)	_onFinish();
	}
	
}