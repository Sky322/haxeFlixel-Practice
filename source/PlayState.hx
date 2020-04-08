package;

import haxe.display.Protocol.HaxeResponseErrorData;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState{
	static private var hero:Hero;
	override public function create(){
		hero = new Hero(20,20);
		add(hero);
		super.create();
		add(new FlxText(200,200,0,"Hello World", 32));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
