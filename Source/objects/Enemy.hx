package objects;

import flash.events.Event;
import motion.Actuate;
import Std.random;

/**
 * ...
 * @author Adem
 */
class Enemy extends Entity
{
	// VARIABLES
	
	private var _step: Int = 5;
	
	// PROPERTIES
	
	// CONSTRUCTORS
	public function new() 
	{
		var x = 200 + random(300);
		var y = random(400);
		super('purpleblock.png', x, y);
	}
	
	// HANDLERS
	
	
	
	
	// PUBLIC FUNCTIONS
	
	public function update() {
		var newX = this.randomLocation(this.x, stage.width);
		var newY = this.randomLocation(this.y, stage.height);
		Actuate.tween(this, 0, { x: newX, y: newY } );
	}
	
	
	// PRIVATE FUNCTIONS
	
	private function randomLocation(value: Float, maxValue: Float) {
		var operator = random(2);
		switch (operator) 
		{
			case 1:
				var newVal = value += this._step;
				return newVal > maxValue ? maxValue : newVal;
			default:
				var newVal = value -= this._step;
				return newVal < 0 ? 0 : newVal;
		}
	}
	
}