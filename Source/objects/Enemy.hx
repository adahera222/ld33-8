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
		
		var timer = new Timer(100);
		timer.run = onUpdate;
		//stage.addEventListener(Event.ENTER_FRAME, onUpdate);
	}
	
	// HANDLERS
	
	private function onUpdate() {
		var newX = this.operator(this.x);
		var newY = this.operator(this.y);
		Actuate.tween(this, 0, { x: newX, y: newY } );
	}
	
	
	// PUBLIC FUNCTIONS
	
	
	
	
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