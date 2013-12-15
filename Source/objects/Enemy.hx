package objects;

import flash.events.Event;
import flash.geom.Point;
import flash.geom.Rectangle;
import motion.Actuate;
import Std.random;

/**
 * Enemy
 * Auto-movable enemy object class.
 * @author Adem
 */
class Enemy extends Entity
{

	static var SCREEN_BOUNDS = new Rectangle(0, 0, 640, 480);
	
	// VARIABLES
	
	private var _safeZone: Int;
	
	// PROPERTIES
	
	// CONSTRUCTORS
	public function new(safeZone: Int) 
	{
		this._safeZone = safeZone;
		var start = this.getRandomPoint();
		
		super('purpleblock.png', start.x, start.y);
		
		this.gotoPoint();
	}
	
	// HANDLERS
	
	// PUBLIC FUNCTIONS
	
	public function update() 
	{
		
	}
		
	// PRIVATE FUNCTIONS
	
	private function getRandomPoint()
	{
		var x = random(640);
		var y = random(480);
		switch (this._safeZone) 
		{
			case 1:
				if (x > 589 && y < 51) { x = random(640) - 51; }
			case 2:
				if (x < 51 && y > 429) { x = 51 + random(590);  }
			case 3:
				if (x > 589 && y > 429) { x = random(640) - 51; }
			default:
				if (x < 51 && y < 51) { x = 51 + random(590); }
		}
		return new Point(x, y);
	}
	
	private function gotoPoint() 
	{
		var position;
		do {
			position = getRandomPoint();
		} while ( !SCREEN_BOUNDS.containsRect(new Rectangle(position.x, position.y, this.width, this.height)) );
		
		Actuate.tween(this, random(10), { x: position.x, y: position.y } ).onComplete(this.gotoPoint);
	}
}