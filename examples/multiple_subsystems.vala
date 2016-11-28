/*
The MIT License (MIT)

Copyright (c) <2013> <SDL2.0 vapi>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
//FOR: SDL2 
//Maintainer: PedroHLC, Txasatonga, Desiderantes

// Compilation command:
// valac -o "basics" --pkg sdl2 --pkg sdl2-gfx --pkg sdl2-ttf --pkg sdl2-image --pkg sdl2-mixer -X -lSDL2_image  -X -lSDL2_ttf -X -lSDL2_mixer -X -lSDL2_gfx "multiple_subsystems.vala"

using SDL;
using SDLImage;
using SDLTTF;
using SDLMixer;


public class Example {
	protected static Video.Window window;
	protected static Video.Renderer? window_renderer;

	public static void main() {
		SDL.init (SDL.InitFlag.EVERYTHING| SDLImage.InitFlags.ALL);
		SDLTTF.init();
		
		window = new Video.Window ("Testing SDL 2 in Vala: Keyboard, Textures and Sound", Video.Window.POS_CENTERED, Video.Window.POS_CENTERED, 800,600, Video.WindowFlags.RESIZABLE);
		var a= SDLMixer.open (44100,Audio.AudioFormat.S16LSB,2,4096);
		stdout.printf("%d\n",a);
		window_renderer = Video.Renderer.create (window, -1, Video.RendererFlags.ACCELERATED | Video.RendererFlags.PRESENTVSYNC);
		window.show ();
		assert (window_renderer != null);

		// Open surface and after transform to texture
		Video.Surface img= SDLImage.load ("pic.png");
		var texture_img= Video.Texture.create_from_surface (window_renderer, img);		
		assert (texture_img != null);

		// Load music
		Music sfx= new Music ("sound.ogg");
		assert (sfx != null);
		
		// Load font as surface and transform to texture.
		Font font= new Font ("font.ttf", 30);
		assert (font != null);

		string text;
		int seconds;
		int percentage;
		switch ( SDL.get_power_info( out seconds, out percentage ) ) {
			case SDL.PowerState.ON_BATTERY :
				text = "Your battery has %d %% charge, approximately %d minutes".printf (percentage, seconds/60);
				break;
			case SDL.PowerState.CHARGING:
				text = "You battery is charging and it's at %d %% of its capacity".printf (percentage);
				break;
			case SDL.PowerState.CHARGED:
				text = "Your battery is fully charged. Hooray!";
				break;
			case SDL.PowerState.NO_BATTERY:
				text = "Your system is not using a battery. Why would you do that?";
				break;
			case SDL.PowerState.UNKNOWN:
			default:
				text = "We don't really know what's going on with your system energy";
				break;
		}
		Video.Surface info = font.render_blended_wrapped (text, {10,10,10,255}, 240);
		var texture_info = Video.Texture.create_from_surface (window_renderer, info);	
		assert (texture_info != null);
		var row =0;
		var column =0;
		//Main loop
		for (Event e = {0}; e.type != EventType.QUIT; Event.poll (out e)) {
			window_renderer.clear ();
			window_renderer.set_draw_color (100, 200, 200, 250);
			window_renderer.fill_rect ( {0, 0, 800, 600} ) ;
			
			if (e.type == EventType.KEYDOWN) {
				if (e.key.keysym.sym == Input.Keycode.DOWN) {
					row+=10;
				}
				if (e.key.keysym.sym == Input.Keycode.UP) {
					row-=10;
				}
					
				if (e.key.keysym.sym == Input.Keycode.LEFT) {
					column-=20;
				}
				if (e.key.keysym.sym == Input.Keycode.RIGHT) {
					column+=20;
				}
				if (e.key.keysym.sym== Input.Keycode.SPACE) { // When press space sounds.
					sfx.play (1);
				}
			}
		window_renderer.copy (texture_img, {0, 0, img.w, img.h} , {column, row, img.w*2, img.h*2});
		window_renderer.copy (texture_info, {0, 0, info.w, info.h} , {500, 400, info.w, info.h});
		window_renderer.present ();
		window.update_surface ();
		SDL.Timer.delay (10);
		}
	SDL.quit ();
	}
}
