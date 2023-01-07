module mob.mob;

import std.stdio;
import mob.goblin;
import position.vec2;
import raylib;

public interface MobInterface {
    public void onTick();
    public void onHurt();
    public void onMove();
    public void onSpawn();
}

public abstract class MobClass : MobInterface {
    private int health = 100;
    Vec2 position;
    Color color;

    this( int x, int y ) {
        this.position = new Vec2( x, y );
    }

    public void hurt( int amount ) {
        this.health -= amount;
    }

    public void heal( int amount ) {
        this.health += amount;
    }

    public int getX() {
        return this.position.getX();
    }

    public int getY() {
        return this.position.getY();
    }
}

public class MobHandler {

    private MobClass[] mobs;

    public void spawnMob( string type, int x, int y ) {
        if (type == "goblin") {
            mobs ~= new Goblin( x, y );
        }
    }

    public MobClass[] getIterator() {
        return this.mobs;
    }
}