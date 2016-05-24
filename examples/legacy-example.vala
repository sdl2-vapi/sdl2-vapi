using SDL;
using SDLGraphics;

//Shameless conversion of the code found at https://wiki.gnome.org/Projects/Vala/SDLSample


public class SDLSample : Object {

    private const int SCREEN_WIDTH = 640;
    private const int SCREEN_HEIGHT = 480;
    private const int SCREEN_BPP = 32;
    private const int DELAY = 10;

    private Video.Window window;
    private Video.Renderer? renderer;
    private GLib.Rand rand;
    private bool done;

    public SDLSample () {
        this.rand = new GLib.Rand ();
    }

    public void run () {
        init_video ();

        while (!done) {
            draw ();
            process_events ();
            SDL.Timer.delay (DELAY);
        }
    }

    private void init_video () {
		window = new Video.Window ("Vala SDL Demo", Video.Window.POS_CENTERED, Video.Window.POS_CENTERED, SCREEN_WIDTH,SCREEN_HEIGHT, Video.WindowFlags.RESIZABLE);
		renderer = Video.Renderer.create (window, -1, Video.RendererFlags.ACCELERATED | Video.RendererFlags.PRESENTVSYNC);
		window.show ();
		assert (renderer != null);
    }

    private void draw () {
    	int w;
    	int h;
    	window.get_size(out w, out h);
        int16 x = (int16) rand.int_range (0, w);
        int16 y = (int16) rand.int_range (0, h);
        int16 radius = (int16) rand.int_range (0, 100);
        uint32 color = rand.next_int ();

        Circle.fill_color (this.renderer, x, y, radius, color);
        Circle.outline_color_aa (this.renderer, x, y, radius, color);

        renderer.present();
    }

    private void process_events () {
        Event event;
        while (Event.poll (out event) == 1) {
            switch (event.type) {
            case EventType.QUIT:
                this.done = true;
                break;
            case EventType.KEYDOWN:
                this.on_keyboard_event (event.key);
                break;
            }
        }
    }

    private void on_keyboard_event (KeyboardEvent event) {
        if (is_alt_enter (event.keysym)) {
            window.set_fullscreen(0);
        }
    }

    private static bool is_alt_enter (Input.Key key) {
        return ((key.mod & Input.Keymod.LALT)!=0)
            && (key.sym == Input.Keycode.RETURN
                    || key.sym == Input.Keycode.KP_ENTER);
    }

    public static int main (string[] args) {
        SDL.init (SDL.InitFlag.EVERYTHING| SDLImage.InitFlags.ALL);

        var sample = new SDLSample ();
        sample.run ();

        SDL.quit ();

        return 0;
    }
}
