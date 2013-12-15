package objects;

import Std.random;

/**
 * ...
 * @author armornick
 */
class Coin extends Entity
{

	public function new() 
	{
		var x = random(640);
		var y = random(480);
		
		super("coin.png", x, y);
	}
	
}