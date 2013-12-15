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
import objects.StoryScreen;
import objects.TitleScreen;

import motion.easing.Elastic;
import motion.easing.Bounce;
import motion.easing.Cubic;
import motion.easing.Quad;

import motion.Actuate;


class Main extends Sprite {

	public static var GAME_OVER = "Main.GAME_OVER";
	public static var TITLE_SCREEN = 'Main.TITLE_SCREEN';
	public static var STORY_SCREEN = 'Main.STORY_SCREEN';
	
	var player:Player;
	var currentScreen:Screen;
	var levelMap:StringMap<Screen>;
	var niveau:Int = 1;
	
	// CONSTRUCTORS
	
	public function new () {
		
		super ();
		levelMap = new StringMap();
		
		createPlayer();
		
		createGameOverLevel();
		createStoryScreen();
		createTitelScreen();
		
		
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
	
	private function createLevel()
	{
		var id = Std.string(this.niveau);
		var numberOfEnemies = this.niveau * 2;
		
		// create and init new level
		var level = new Level(id, numberOfEnemies, this.nextLevel);
		level.player = this.player;
		// add level to table
		levelMap.set(id, level);
		// set current level if not set
		/*
		unnecessary with title screen in place
		if (currentScreen == null) 
		{
			currentScreen = level;
			addChild(currentScreen);
		}
		*/
	}
	
	private function createTitelScreen()
	{
		var level = new TitleScreen(TITLE_SCREEN, startGame, openHowTo);
		currentScreen = level;
		levelMap.set(TITLE_SCREEN, level);
		addChild(level);

	}
	
	private function startGame() 
	{
		this.niveau = 1;
		createLevel();
		this.changeLevel("1");
	}
	
	private function nextLevel()
	{
		
		this.niveau += 1;
		this.createLevel();
		this.changeLevel(Std.string(this.niveau));
	}
	
	private function openHowTo()
	{
		this.changeLevel(STORY_SCREEN);
	}
	
	private function createGameOverLevel()
	{
		var level = new GameOverScreen(GAME_OVER);
		level.onFinish = function ()
		{
			this.changeLevel(TITLE_SCREEN);
		}
		levelMap.set(GAME_OVER, level);
	}
	
	private function createStoryScreen()
	{
		var level = new StoryScreen(STORY_SCREEN);
		level.onFinish = function ()
		{
			this.startGame();
		}
		levelMap.set(STORY_SCREEN, level);
	}
	
}