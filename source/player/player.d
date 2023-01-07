module player.player;

import raylib;
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

    public int getX() {
        return position.getX();
    }

    public int getY() {
        return position.getY();
    }

    public void doControls() {
        if (IsKeyPressed(KeyboardKey.KEY_LEFT)) {
            if ( this.getX() > 0 ) {
                this.moveX( -1 );
            }
        } else if ( IsKeyPressed(KeyboardKey.KEY_RIGHT) ) {
            if ( this.getX() < 9 ) {
                this.moveX( 1 );
            }
        } else if ( IsKeyPressed(KeyboardKey.KEY_UP) ) {
            if ( this.getY() > 0 ) {
                this.moveY( -1 );
            }
        } else if ( IsKeyPressed(KeyboardKey.KEY_DOWN) ) {
            if ( this.getY() < 9 ) { 
                this.moveY( 1 );
            }
        }
    }

    public void draw() {
        int fontSize = 60;

        DrawText("X", this.getX() * fontSize, this.getY() * fontSize, fontSize, Colors.RED);
    }

    public void debugPrint() {
        int[] posAsArray = position.getAsArray();
        writeln(this.name, " is currently at: ", posAsArray[0], ",", posAsArray[1]);
    }
}