
import raylib;
import std.stdio;
import player.player;

void main() {

    validateRaylibBinding();
    InitWindow( 800, 600, "minimal_rpg" );
    SetTargetFPS(30);

    Player player = new Player( "debug player", 0, 0 );

    player.debugPrint();

    while ( !WindowShouldClose() ) {
        writeln("hi");
    }

    CloseWindow();
}

