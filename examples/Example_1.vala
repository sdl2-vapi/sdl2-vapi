// Compilation command:
// valac -o "Example_1" --pkg gee-1.0 --pkg sdl2 --pkg sdl2-gfx --pkg sdl2-ttf --pkg sdl2-image --pkg sdl2-mixer -X -lSDL2_image  -X -lSDL2_ttf -X -lSDL2_mixer -X -lSDL2_gfx "Example_1.vala"

using SDL;
using SDLImage;
using SDLTTF;
using SDLMixer;


public class Example 
	{
	protected static SDL.Window window;
	protected static SDL.Renderer WIN_RENDERER;

	public static void main () 
		{
		SDL.init (SDL.InitFlag.EVERYTHING| SDLImage.InitFlags.ALL);
		SDLTTF.init();
		
		window = new Window ("Testing SDL 2.0 in Vala: Keyboard, Textures and Sound", Window.POS_CENTERED, Window.POS_CENTERED, 800,600, WindowFlags.RESIZABLE);
		var a= SDLMixer.open(44100,SDL.AudioFormat.S16LSB,2,4096); stdout.printf("%d\n",a);
		WIN_RENDERER = new SDL.Renderer (window, -1, SDL.RendererFlags.ACCELERATED | SDL.RendererFlags.PRESENTVSYNC);
		
		window.show ();
		Event e;
		// Open surface and after transform to texture
		SDL.Surface imagen= SDLImage.load("boy.png");
		SDL.Texture Timagen= new Texture.from_surface (WIN_RENDERER, imagen);		
		
		// Load music
		Music musica= new Music ("yahoo.ogg");
		
		// Load font as surface and transform to texture.
		Font Fuente= new Font("KatamotzIkasi.ttf", 30);
		SDL.Surface letras= Fuente.render_blended_wrapped_utf8("Keyboard press: up,left,rigth,down and space", {10,10,10,255}, 240);
		SDL.Texture Tletras = new Texture.from_surface (WIN_RENDERER, letras);	

		var row =0;
		var column =0;

		//Main loop
		for (e = {0}; e.type != EventType.QUIT; Event.poll (out e)){
			WIN_RENDERER.clear();
			WIN_RENDERER.set_draw_color(100, 200, 200, 250);
			WIN_RENDERER.fill_rect( {0, 0, 800, 600} ) ;
			
			if (e.type==EventType.KEYDOWN)
				{
				if ( e.key.keysym.sym== Keycode.DOWN)
					{
					row+=10;
					}
				if ( e.key.keysym.sym== Keycode.UP)
					{
					row-=10;
					}
					
				if ( e.key.keysym.sym== Keycode.LEFT)
					{
					column-=20;
					}
				if ( e.key.keysym.sym== Keycode.RIGHT)
					{
					column+=20;
					}
				if ( e.key.keysym.sym== Keycode.SPACE) // When press space sounds.
					{
					musica.play(1);
					}
			
				}
						
			WIN_RENDERER.copy (Timagen, {0, 0, imagen.w, imagen.h} , {column, row, imagen.w*2, imagen.h*2});
			WIN_RENDERER.copy (Tletras, {0, 0, letras.w, letras.h} , {500, 400, letras.w, letras.h});
			WIN_RENDERER.present();
			window.update_surface ();
			SDL.Timer.delay(10);

			}

	window.destroy (); //Actually useless since it is called when window is disposed
	SDL.quit ();
	}
}
