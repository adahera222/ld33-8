package;


import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import objects.Entity;
import objects.Player;

import motion.easing.Elastic;
import motion.easing.Bounce;
import motion.easing.Cubic;
import motion.easing.Quad;

import motion.Actuate;


class Main extends Sprite {
	
	static var player:Player;
	
	// CONSTRUCTORS
	
	public function new () {
		
		super ();
		
		player = new Player(15);
		addChild(player);
		
		// register callback functions
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		stage.addEventListener(Event.ENTER_FRAME, onUpdate);
		
		
	}
	
	// HANDLERS
	
	static function onKeyDown (event:KeyboardEvent)
	{
		if (player == null) return;
		
		switch (event.keyCode) 
		{
			case Keyboard.RIGHT:
				player.GoRight();
			case Keyboard.LEFT:
				player.GoLeft();
			case Keyboard.UP:
				player.GoUp();
			case Keyboard.DOWN:
				player.GoDown();
		}
	}
	
	static function onKeyUp (event:KeyboardEvent)
	{
		
	}
	
	static function onUpdate(event:Event)
	{
		// COLLISION DETECTION HERE
	}
	
	
}