module mob.goblin;

import raylib;
import std.stdio;
import mob.mob;

public class Goblin : MobClass {

    this( int x, int y ) {
        super( x, y, Colors.GREEN, "%" );
    }

    override
    public void onHurt() {
    }

    override
    public void onMove() {

    }

    override
    public void onSpawn() {

    }

    override
    public void onTick() {
        randomMovement(50.0);
    }

}