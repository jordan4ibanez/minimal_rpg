module map.map;

import std.stdio;
import raylib;
import std.array;
import std.conv;
import std.string;
import player.player;
import mob.mob;

public class Map {

    // No fancy things here, just a simple vector
    private int[][] data = [
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0,0],
        
    ];

    public void draw( Player player, MobHandler mobHandler ) {

        int x = 0;
        int y = 0;

        int litX = 0;
        int litY = 0;

        int fontSize = 60;

        int playerX = player.getX();
        int playerY = player.getY();

        MobClass[] mobIterator = mobHandler.getIterator();

        foreach (int[] key; data) {
            foreach (int character; key) {

                bool failure = false;

                // Don't draw behind mobs
                foreach (MobClass mob; mobIterator) {

                    int mobX = mob.getX();
                    int mobY = mob.getY();

                    if ( mobX == litX && mobY == litY ){
                        failure = true;
                    }

                }
                
                // Don't draw behind players
                if ( playerX == litX && playerY == litY ){
                    failure = true;
                }

                if (!failure) {
                    DrawText(to!string(character).toStringz, x, y, fontSize, Colors.WHITE);
                }

                x += fontSize;

                litX += 1;
            }

            x = 0;
            y += fontSize;

            litX = 0;
            litY += 1;
        }

    }
    
}