package objects;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

/**
 * ...
 * @author Adem
 */
class TitleScreen extends Screen
{
	// VARIABLES
	
	private var _state:Bool = true;
	private var startButton: Button;
	private var howToButton: Button;
	
	// PROPERTIES
	
	// CONSTRUCTS
	public function new(_onStartSelect, _onHowToSelect) 
	{
		super('titlescreen', this.onSelect);
		
		this.startButton = new Button('start_game.png', 150, 150, _onStartSelect);
		this.howToButton = new Button('how_to_play.png', 150, 100, _onHowToSelect);
		
		addChild(startButton);
	}
	
	// HANDLERS
	
	override public function onKeyDown(event: KeyboardEvent)
	{
		switch (event.keyCode) 
		{
			case Keyboard.UP, Keyboard.DOWN:
				this._state = !this._state;
				
				if (this._state) 
				{
					this.removeChild(this.howToButton);
					this.addChild(this.startButton);
				} 
				else
				{
					this.removeChild(this.startButton);
					this.addChild(this.howToButton);
				}
				
			case Keyboard.ENTER:
				
		}
	}
	
	public function onSelect()
	{
		
	}
	
	// PUBLIC METHODS
	
	// PRIVATE METHODS
	
}