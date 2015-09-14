#README

This is a unnoficial set of vapi files for SDL2, please be wary of using it in stable code.
This version is meant to be a continuation and direct replacement for the gitorious repo located  at https://gitorious.org/sdl-2-0-vala-vapi, and any personal repo from PedroHLC and Desiderantes

If you spot any bug, any missing functionality, or any regression, you should report it here instead of the Gitorious repo, but please, keep in mind that this is still not stable
Thanks

###But wait, where's SDL_Log, ..., etc?

The following will not be implemented:
 - SDL_loadso.h: There's a better implementation of that using gmodule-2.0 (part of GLib framework)
 - SDL_log.h: GLib provides a more powerful log implementation
 - SDL_system.h: Already provided by GLib
 - SDL_platform.h: Not useful on Vala
 - SDL_endian.h: Already provided by GLib
 - SDL_bits.h: Already provided by GLib
 - SDL_stdinc.h: Already provided by GLib
 - SDL_filesystem.h: Already provided by GLib

