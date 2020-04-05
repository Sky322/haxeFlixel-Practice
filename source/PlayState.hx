package;

import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		add(new FlxText(0,0,0,"Hello World", 32));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
