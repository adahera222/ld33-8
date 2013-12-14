package;


import flash.display.Sprite;
import objects.Entity;
import motion.easing.Elastic;
import motion.easing.Bounce;
import motion.easing.Cubic;
import motion.easing.Quad;

import motion.Actuate;


class Main extends Sprite {
	
	
	public function new () {
		
		super ();
		
		var blok1 = new Entity("redblock.png", 25, 25);
		var blok2 = new Entity("redblock.png", 240, 25);
		var blok3 = new Entity("redblock.png", 25, 240);
		var blok4 = new Entity("redblock.png", 240, 240);
		
		addChild(blok1);
		addChild(blok2);
		addChild(blok3);
		addChild(blok4);
		
		Actuate.tween(blok1, 3, { x: 300, y: 300 } ).delay(0.4).ease(Bounce.easeOut);
		Actuate.tween(blok2, 3, { x: 400, y: 200 } ).delay(0.4).ease(Elastic.easeIn);
		Actuate.tween(blok3, 3, { x: 50, y: 3 } ).delay(0.4).ease(Cubic.easeInOut);
		Actuate.tween(blok4, 3, { x: 100, y: 50 } ).delay(0.4).ease(Quad.easeOut);
		
	}
	
	
}