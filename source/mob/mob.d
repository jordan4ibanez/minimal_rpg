module mob.mob;

import std.stdio;

import mob.goblin;
import mob.skeleton;

import position.vec2;
import std.string;
import raylib;
import std.random;

public interface MobInterface {
    public void onTick();
    public void onHurt();
    public void onMove();
    public void onSpawn();
}

public abstract class MobClass : MobInterface {
    private int health = 100;
    private Vec2 position;
    private Color color;
    private string shape;

    this( int x, int y, Color color, string shape ) {
        this.position = new Vec2( x, y );

        this.color = color;
        this.shape = shape;
    }

    abstract
    public void onTick();
    abstract
    public void onHurt();
    abstract
    public void onMove();
    abstract
    public void onSpawn();

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

    public Color getColor() {
        return this.color;
    }

    public string getShape() {
        return this.shape;
    }

    protected void randomMovement(float chance) {
        Random random = Random( unpredictableSeed() );
        
        if ( uniform(0.0, 100.0, random) > chance ) {
            return;
        }

        // Unlink the previous randomness
        random = Random( unpredictableSeed() );

        int dir = uniform(0,4, random);

        final switch (dir) {
            case 0: {
                if ( position.getX() > 0 ) {
                    position.addX( -1 );
                }
                break;
            }
            case 1: {
                if ( position.getX() < 9 ) {
                    position.addX( 1 );
                }
                break;
            }
            case 2: {
                if ( position.getY() > 0 ) {
                    position.addY( -1 );
                }
                break;
            }
            case 3: {
                if ( position.getY() < 9 ) {
                    position.addY( 1 );
                }
            }

        }

    }
}

public class MobHandler {

    private MobClass[] mobs;

    public void spawnMob( string type, int x, int y ) {
        if ( type == "goblin" ) {
            mobs ~= new Goblin( x, y );
        } else if ( type == "skeleton" ) {
            mobs ~= new Skeleton( x, y );
        }
    }

    public MobClass[] getIterator() {
        return this.mobs;
    }

    public void drawMobs() {
        foreach ( MobClass mob; mobs ) {
            int mobX = mob.getX();
            int mobY = mob.getY();

            int fontSize = 60;

            DrawText(mob.getShape().toStringz, mobX * fontSize, mobY * fontSize, fontSize, mob.getColor());
            
        }
    }

    public void mobsOnTick() {
        foreach (MobClass mob; mobs) {
            mob.onTick();            
        }
    }
}