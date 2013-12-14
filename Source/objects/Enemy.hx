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
		return new Point(x, y);
	}
	
	private function gotoPoint() 
	{
		var position = getRandomPoint();
		Actuate.tween(this, random(10), { x: position.x, y: position.y } ).onComplete(this.gotoPoint);
	}
}