module mob.skeleton;

import raylib;
import std.stdio;
import mob.mob;

public class Skeleton : MobClass {

    this( int x, int y ) {
        super( x, y, Colors.GRAY, "#" );
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
        randomMovement(100.0);

    }

}