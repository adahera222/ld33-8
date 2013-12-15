package objects;

/**
 * ...
 * @author Adem
 */
class Button extends Entity
{
	// VARIABLES
	
	private var _onSelect: Void -> Void;
	
	// PROPERTIES
	
	// CONSTRUCTORS
	public function new(fname, x, y, ?_onSelect) 
	{
		super(fname, x, y);
		this._onSelect = _onSelect;

		this.width = 150;
		this.height = 35;
	}
	
	// HANDLERS
	
	public function onSelect()
	{
		this._onSelect();
	}
	
	// PUBLIC METHODS
	
	// PRIVATE METHODS
}