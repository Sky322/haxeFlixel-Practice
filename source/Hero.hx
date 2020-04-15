package;

import flixel.FlxSprite;
import flixel.FlxG;

class Hero extends FlxSprite{
    public function new(x:Float = 0, y:Float = 0){
        super(x,y);
        makeGraphic(15,15);
        drag.x = drag.y = 1200;
    }

    function movement(){
         var spd:Float = 200;
        var up:Bool = false;
        var down:Bool = false;
        var left:Bool = false;
        var right:Bool = false;
        up = FlxG.keys.anyPressed([UP, W]);
        down = FlxG.keys.anyPressed([DOWN, S]);
        left = FlxG.keys.anyPressed([LEFT, A]);
        right = FlxG.keys.anyPressed([RIGHT, D]);

        if (up && down){
            up = down = false;
        }
        if (left && right){
            left = right = false;
        }
        if (up){
            velocity.y = -spd;
        }
        if (down){
            velocity.y = spd;
        }
        if (left){
            velocity.x = -spd;
        }
        if (right){
            velocity.x = spd;
        }
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
            this.color = 0xf0f000;
        }
        movement();
        super.update(elapsed);
    }
}