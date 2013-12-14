package;


import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import haxe.ds.StringMap.StringMap;
import objects.Enemy;
import objects.Entity;
import objects.Level;
import objects.Player;

import motion.easing.Elastic;
import motion.easing.Bounce;
import motion.easing.Cubic;
import motion.easing.Quad;

import motion.Actuate;


class Main extends Sprite {
	
	var player:Player;
	var currentLevel:Level;
	var levelMap:StringMap<Level>;
	
	// CONSTRUCTORS
	
	public function new () {
		
		super ();
		levelMap = new StringMap();
		
		player = new Player(15);
		//addChild(player);
		
		createLevel("1", 5);
		
		// register callback functions
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		stage.addEventListener(Event.ENTER_FRAME, onUpdate);
		
	}
	
	// HANDLERS
	
	function onKeyDown (event:KeyboardEvent)
	{
		if (currentLevel == null) return;
		currentLevel.onKeyDown(event);
	}
	
	function onKeyUp (event:KeyboardEvent)
	{
		if (currentLevel == null) return;
		currentLevel.onKeyUp(event);
	}
	
	function onUpdate(event:Event)
	{
		if (currentLevel == null) return;
		currentLevel.onUpdate(event);
	}
	
	// PRIVATE METHODS
	
	private function createLevel(id, numberOfEnemies)
	{
		// create and init new level
		var level = new Level(id, numberOfEnemies);
		level.player = this.player;
		// add level to table
		levelMap.set(id, level);
		// set current level if not set
		if (currentLevel == null) 
		{
			currentLevel = level;
			addChild(currentLevel);
		}
	}
	
	
}