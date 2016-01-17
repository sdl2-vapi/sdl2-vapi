/*
The MIT License (MIT)

Copyright (c) <2016> <SDL2.0 vapi>

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
//FOR: SDL2.0.4 - This is not official, to be futurely changed for the official binding
//Maintainer: PedroHLC, Txasatonga, Desiderantes
namespace SDL{

	[CCode (cname="SDL_WinRT_Path", cprefix="SDL_WINRT_PATH_", cheader="SDL2/SDL_system.h")]
	public enum WinRTPath{
		/** \brief The installed app's root directory.
		 * Files here are likely to be read-only. 
		 */
		INSTALLED_LOCATION,
		/** \brief The app's local data store.  Files may be written here 
		*/
		SDL_WINRT_PATH_LOCAL_FOLDER,
		/** \brief The app's roaming data store.  Unsupported on Windows Phone.
		 * Files written here may be copied to other machines via a network
		 * connection.
		*/
		SDL_WINRT_PATH_ROAMING_FOLDER,
		/** \brief The app's temporary data store.  Unsupported on Windows Phone.
		 * Files written here may be deleted at any time. 
		 */
		SDL_WINRT_PATH_TEMP_FOLDER
	}

	[CCode (cname="SDL_WinRTGetFSPathUTF8", cheader="SDL2/SDL_system.h")]
	public static unowned string get_fs_path(WinRTPath path_type);
 
}