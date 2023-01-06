module position.vec2;

import std.stdio;

public class Vec2 {
    private int x = 0;
    private int y = 0;

    this( int x, int y ) {
        this.x = x;
        this.y = y;
    }

    public int getX() {
        return this.x;
    }

    public int getY() {
        return this.y;
    }

    public void setX( int x ) {
        this.x = x;
    }

    public void setY( int y ) {
        this.y = y;
    }

    public void addX( int x ) {
        this.x += x;
    }

    public void addY( int y ) {
        this.y += y;
    }

    public void debugPrint() {
        writeln("X: ", x, " | Y: ", y);
    }

}