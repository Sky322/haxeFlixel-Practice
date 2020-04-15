package;

import Fireball;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import Hero;
import Wall;
import flixel.FlxState;

class PlayState extends FlxState
{
	private static var WALL_COUNT(default, never) = 20;
	private static var WALL_START_X(default, never) = 0;
	private static var WALL_START_Y(default, never) = 20;

	private static var FIREBALL_COUNT(default, never) = 30;
	private static var FIREBALL_SPAWN_BORDER(default, never) = 50;

	private var hero:Hero;
	private var walls:FlxTypedGroup<Wall>;
	private var fireballs:FlxTypedGroup<Fireball>;

	var ending:Bool;
	var won:Bool;

	override public function create():Void
	{
		super.create();

		hero = new Hero();
		add(hero);

		initializeWalls();
		initializeFireballs();
	}

	private function initializeWalls() {
		walls = new FlxTypedGroup<Wall>();

		for (i in 0...WALL_COUNT) {
			var x:Float = WALL_START_X + (i * Wall.WIDTH);
			var y:Float = WALL_START_Y;
			var wall:Wall = new Wall(x, y);
			walls.add(wall);
		}
		add(walls);
	}

	private function initializeFireballs() {
		fireballs = new FlxTypedGroup<Fireball>();

		for (i in 0...FIREBALL_COUNT) {
			var x:Float = FlxG.random.int(FIREBALL_SPAWN_BORDER, 
				FlxG.width - FIREBALL_SPAWN_BORDER);
			var y:Float = FlxG.random.int(FIREBALL_SPAWN_BORDER, 
				FlxG.height - FIREBALL_SPAWN_BORDER);
			var fireball = new Fireball(x, y);
			fireballs.add(fireball);
		}
		add(fireballs);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		FlxG.collide(hero, walls);

		FlxG.overlap(hero, fireballs, resolveHeroFireballOverlap);

		screenWrapObject(hero);
		for (fireball in fireballs) {
			screenWrapObject(fireball);

		ifEnding();
		}
	}

	private function screenWrapObject(wrappingObject:FlxObject) {
		if (wrappingObject.x > FlxG.width) {
			wrappingObject.x = 0 - wrappingObject.width;
		} else if (wrappingObject.x + wrappingObject.width < 0) {
			wrappingObject.x = FlxG.width;
		}

		if (wrappingObject.y > FlxG.height) {
			wrappingObject.y = 0 - wrappingObject.height;
		} else if (wrappingObject.y + wrappingObject.height < 0) {
			wrappingObject.y = FlxG.height;
		}
	}

	/**
		Function called when an overlap between hero and fireball is detected.
	**/
	private function resolveHeroFireballOverlap(hero:Hero, fireball:Fireball) {
		trace("Hero and Fireball collided!");
		fireball.kill();
		hero.kill();
		ending = true;
	}

	private function ifEnding()
		if (ending){
			FlxG.switchState(new GameOverState());
		}
}
