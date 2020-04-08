package;

import flixel.FlxSprite;

class Hero extends FlxSprite{
    public function new(x:Float = 0, y:Float = 0){
        super(x,y);
        makeGraphic(15,15);
    }

    override function update(elapsed:Float) {
        if (x>250 && y>250){
            this.color = 0xff0000;
        }
        else if (x>250 && y<250){
            this.color = 0x00ff00;
        }
        else if (x<250 && y<250){
            this.color = 0x0000ff;
        }
        else if (x<250 && y>250){
            this.color = 0xf0f0f0;
        }
        
        super.update(elapsed);
    }
}