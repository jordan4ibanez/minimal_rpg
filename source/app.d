
import raylib;
import std.stdio;
import player.player;
import map.map;
import mob.mob;

void main() {

    // Everything in this game is rigid and basic

    validateRaylibBinding();
    InitWindow( 800, 600, "minimal_rpg" );
    SetTargetFPS(60);

    Player player = new Player( "debug player", 0, 0 );

    Map map = new Map();

    MobHandler mobHandler = new MobHandler();

    mobHandler.spawnMob("goblin", 1,1);
    mobHandler.spawnMob("skeleton", 2,3);


    while ( !WindowShouldClose() ) {


        bool movement = player.doControls();

        if ( movement ) {

        }


        BeginDrawing();
        ClearBackground( Colors.BLACK );

        foreach ( MobClass key; mobHandler.getIterator() ) {
            key.onHurt();
        }


        map.draw( player, mobHandler );

        mobHandler.drawMobs();
        
        player.draw();

        EndDrawing();
    }

    CloseWindow();
}

