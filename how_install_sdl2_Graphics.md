Install steps	

	1. Make sure you already have the libraries (On Debian based systems, you need the libsdl2-*-dev packages)
	2. Copy the desired vapi files in the 3rd party vapi directory: /usr/local/share/vala/vapi/

You can optionally run the install script (sh INSTALL) to do the copy for you
You can optionally export VAPI_PATH to customize the path where the vapis will
be instaled.

Check the meson files in `examples` for an example on using this vapi files.

