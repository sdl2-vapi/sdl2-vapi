using SDL;
using SDLImage;
using SDLTTF;
using SDLMixer;
using Gee;



public class Example 
	{
	protected static SDL.Window window;
	protected static SDL.Renderer WIN_RENDERER;

	public static void main () 
		{
		SDL.init (SDL.InitFlag.EVERYTHING| SDLImage.InitFlags.ALL);
		window = new Window ("Testing SDL 2.0 in Vala: Keyboard, Textures and Sound", Window.POS_CENTERED, Window.POS_CENTERED, 800,600, WindowFlags.RESIZABLE);
		var a= SDLMixer.open(44100,SDL.AudioFormat.S16LSB,2,4096); stdout.printf("%d\n",a);
		WIN_RENDERER = new SDL.Renderer (window, -1, SDL.RendererFlags.ACCELERATED | SDL.RendererFlags.PRESENTVSYNC);
		window.show ();
		Event e;

		SDL.Surface imagen= SDLImage.load("boy.png");
		SDL.Texture Timagen= new Texture.from_surface (WIN_RENDERER,imagen);		
		Music musica= new Music ("yahoo.ogg");
		
		var row =0;
		var column =0;

		for (e = {0}; e.type != EventType.QUIT; Event.poll (out e)){
			WIN_RENDERER.clear();
			WIN_RENDERER.set_draw_color(100,200,200,250);
			WIN_RENDERER.fill_rect( {0,0,800,600} ) ;
			
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
				if ( e.key.keysym.sym== Keycode.SPACE) // When push space sounds.
					{
					musica.play(1);
					}
			
				}
						
			WIN_RENDERER.copy (Timagen, {0, 0, imagen.w, imagen.h} , {column, row, imagen.w*2, imagen.h*2});
			WIN_RENDERER.present();
			window.update_surface ();
			SDL.Timer.delay(10);

			}

	window.destroy (); //Actually useless since it is called when window is disposed
	SDL.quit ();
	}
}
