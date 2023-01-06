module player.player;

import position.vec2;


public class Player {
    
    private Vec2 position;

    this( int x, int y ) {
        this.position = new Vec2( x, y );
    }

    public void moveX( int x ){
        position.addX( x );
    }

    public void moveY( int y ){
        position.addY( y );
    }

    public void debugPrint() {
        position.debugPrint();
    }
}