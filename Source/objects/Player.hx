package objects;

/**
 * ...
 * @author Adem
 */
class Player extends Entity
{
	// VARIABLES
	
	this._step = 5;
	
	// PROPERTIES
	
	// CONSTRUCTORS
	public function new(step) 
	{
		this._step = step;
		
		super('redblock.png', 50, 200);
	}
	
	// HANDLERS
	
	// PUBLIC METHODS
	
	public function GoLeft()
	{
		this.x -= this._step;
	}
	
	public function GoRight()
	{
		this.x += this._step;
	}
	
	public function GoUp()
	{
		this.y -= this._step;
	}
	
	public function GoDown()
	{
		this.y += this._step;
	}
	
	// PRIVATE METHODS
	
	
	
}