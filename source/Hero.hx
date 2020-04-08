package;

import flixel.FlxSprite;

class Hero extends FlxSprite{
    public function new(x:Float = 0, y:Float = 0){
        super(x,y);
        makeGraphic(15,15);
    }
}