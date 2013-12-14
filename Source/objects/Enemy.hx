package objects;

import flash.events.Event;
import flash.geom.Point;
import motion.Actuate;
import Std.random;

/**
 * ...
 * @author Adem
 */
class Enemy extends Entity
{
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
		var position = getRandomPoint();
		Actuate.tween(this, random(10), { x: position.x, y: position.y } ).onComplete(this.gotoPoint);
	}
}