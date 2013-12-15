package;


import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import haxe.ds.StringMap.StringMap;
import objects.Enemy;
import objects.Entity;
import objects.GameOverScreen;
import objects.Level;
import objects.Player;
import objects.ResourceManager;
import objects.Screen;
import objects.TitleScreen;

import motion.easing.Elastic;
import motion.easing.Bounce;
import motion.easing.Cubic;
import motion.easing.Quad;

import motion.Actuate;


class Main extends Sprite {

	public static var GAME_OVER = "Main.GAME_OVER";
	public static var TITLE_SCREEN = 'Main.TITLE_SCREEN';
	
	var player:Player;
	var currentScreen:Screen;
	var levelMap:StringMap<Screen>;
	
	// CONSTRUCTORS
	
	public function new () {
		
		super ();
		levelMap = new StringMap();
		
		createPlayer();
		
		createGameOverLevel();
		createTitelScreen();
		
		//createLevel("1", 5);
		
		// register callback functions
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		stage.addEventListener(Event.ENTER_FRAME, onUpdate);
		
		//Instance = this;
		
	}
	
	// HANDLERS
	
	function onKeyDown (event:KeyboardEvent)
	{
		if (currentScreen == null) return;
		currentScreen.onKeyDown(event);
	}
	
	function onKeyUp (event:KeyboardEvent)
	{
		if (currentScreen == null) return;
		currentScreen.onKeyUp(event);
	}
	
	function onUpdate(event:Event)
	{
		if (currentScreen == null) return;
		currentScreen.onUpdate(event);
	}
	
	// PUBLIC METHODS
	
	public function changeLevel (id)
	{
		if (!levelMap.exists(id)) return;
		
		if (currentScreen != null) 
		{
			removeChild(currentScreen);
		}
		
		currentScreen = levelMap.get(id);
		addChild(currentScreen);
	}
	
	// PRIVATE METHODS
	
	private function createPlayer()
	{
		player = new Player(15);
		player.onHitEnemy = function ()
		{
			this.changeLevel(GAME_OVER);
		}
	}
	
	private function createLevel(id, numberOfEnemies)
	{
		// create and init new level
		var level = new Level(id, numberOfEnemies);
		level.player = this.player;
		level.onFinish = function ()
		{
			this.changeLevel(GAME_OVER);
		}
		// add level to table
		levelMap.set(id, level);
		// set current level if not set
		if (currentScreen == null) 
		{
			currentScreen = level;
			addChild(currentScreen);
		}
	}
	
	private function createTitelScreen()
	{
		var level = new TitleScreen(TITLE_SCREEN, startGame, openHowTo);
		currentScreen = level;
		addChild(level);

	}
	
	private function startGame() 
	{
		createLevel("1", 5);
	}
	
	private function openHowTo()
	{
		
	}
	
	private function createGameOverLevel()
	{
		var level = new GameOverScreen(GAME_OVER);
		levelMap.set(GAME_OVER, level);
	}
	
	
}