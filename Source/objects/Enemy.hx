package objects;

import flash.events.Event;
import haxe.Timer;
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
		var newX = this.operator(this.x);
		var newY = this.operator(this.y);
		Actuate.tween(this, 0, { x: newX, y: newY } );
	}
	
	
	// PRIVATE FUNCTIONS
	
	private function operator(value: Float) {
		var operator = random(2);
		switch (operator) 
		{
			case 1:
				return value += this._step;
			default:
				return value -= this._step;
		}
	}
	
}