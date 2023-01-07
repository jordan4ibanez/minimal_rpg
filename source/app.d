
import raylib;
import std.stdio;
import player.player;
import map.map;

void main() {

    // Everything in this game is rigid and basic

    validateRaylibBinding();
    InitWindow( 800, 600, "minimal_rpg" );
    SetTargetFPS(60);

    Player player = new Player( "debug player", 0, 0 );

    player.debugPrint();

    Map map = new Map();


    while ( !WindowShouldClose() ) {


        player.doControls();


        BeginDrawing();
        ClearBackground( Colors.BLACK );


        map.draw( player );
        player.draw();

        EndDrawing();
    }

    CloseWindow();
}

