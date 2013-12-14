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
import objects.ResourceManager;

import motion.easing.Elastic;
import motion.easing.Bounce;
import motion.easing.Cubic;
import motion.easing.Quad;

import motion.Actuate;


class Main extends Sprite {

	public static var Instance:Main;
	public static var GAME_OVER = "Main.GAME_OVER";
	
	var player:Player;
	var currentLevel:Level;
	var levelMap:StringMap<Level>;
	
	// CONSTRUCTORS
	
	public function new () {
		
		super ();
		levelMap = new StringMap();
		
		player = new Player(15);
		//addChild(player);
		
		createGameOverLevel();
		createLevel("1", 5);
		
		// register callback functions
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		stage.addEventListener(Event.ENTER_FRAME, onUpdate);
		
		Instance = this;
		
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
	
	// PUBLIC METHODS
	
	public function changeLevel (id)
	{
		if (!levelMap.exists(id)) return;
		
		if (currentLevel != null) 
		{
			removeChild(currentLevel);
		}
		
		currentLevel = levelMap.get(id);
		addChild(currentLevel);
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
	
	private function createGameOverLevel()
	{
		var level = new Level(GAME_OVER, 0);
		level.background = ResourceManager.getBitmap("gameover.png");
		//level.player = this.player;
		levelMap.set(GAME_OVER, level);
	}
	
	
}