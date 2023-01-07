module player.player;

import std.stdio;
import position.vec2;


public class Player {
    
    private string name;
    private Vec2 position;

    this( string name, int x, int y ) {
        this.name = name;
        this.position = new Vec2( x, y );
    }

    public void moveX( int x ){
        position.addX( x );
    }

    public void moveY( int y ){
        position.addY( y );
    }

    public void debugPrint() {
        int[] posAsArray = position.getAsArray();
        writeln(this.name, " is currently at: ", posAsArray[0], ",", posAsArray[1]);
    }
}