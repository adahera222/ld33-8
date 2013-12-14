package objects;

import Std.random;

/**
 * ...
 * @author Adem
 */
class Enemy extends Entity
{
	// VARIABLES
	
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
	
	
	// PRIVATE FUNCTIONS
	
}