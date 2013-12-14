package objects;

/**
 * ...
 * @author Adem
 */
class Player extends Entity
{
	// VARIABLES
	
	private var _step: Int = 5;
	
	// PROPERTIES
	
	// CONSTRUCTORS
	public function new(step) 
	{
		this._step = step;
		
		super('redblock.png', 50, 200);
	}
	
	// HANDLERS
	
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
	
	public function onHit()
	{
		
	}
	
	// PUBLIC METHODS
	
	
	// PRIVATE METHODS
	
}