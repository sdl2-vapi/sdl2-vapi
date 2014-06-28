//FOR: SDL2.0.3 - This is not official, to be futurely changed for the official binding
//Maintainer: PedroHLC

namespace SDL {
	///
	/// Windows
	///
	[CCode (cname="IDirect3DDevice9", cheader="d3d9.h")]
	[Compact]
	public struct IDirect3DDevice9 {}
	
	[CCode (cheader="SDL2/SDL_system.h")]
	[Compact]
	public class Direct3D9  {
		[CCode (cname="SDL_Direct3D9GetAdapterIndex")]
		public static int get_adapter_index(int display_index);
		
		[CCode (cname="SDL_RenderGetD3D9Device")]
		public static IDirect3DDevice9* get_render_device(SDL.Renderer renderer);
		
		[CCode (cname="SDL_DXGIGetOutputInfo")]
		public static void dxgi_get_output_info(int display_index, out int adapter_index, out int output_index);
	}// Direct3D9
	
	
}