README
======

This vapi files are no longer maintained. We merged with the vala-extra-vapi repository [in this commit](https://gitlab.gnome.org/GNOME/vala-extra-vapis/-/commit/f207a42c08d7f5e37af8e3595826a9dd86036ef0). There's a [pending MR](https://gitlab.gnome.org/GNOME/vala/-/merge_requests/135#note_886156) in Gitlab to upstream the sdl2 vapi files 


This is a unnoficial set of vapi files for SDL2, please be wary of using it in stable code.
This version is meant to be a continuation and direct replacement for the gitorious repo located at https://gitorious.org/sdl-2-0-vala-vapi

If you spot any bug, any missing functionality, or any regression, you should report it here instead of the Gitorious repo, but please, keep in mind that this is still not stable.

### But wait, where’s SDL_Log, …, etc?

The following will not be implemented:

 - SDL_loadso.h: There's a better implementation of that using gmodule-2.0 (part of GLib framework)
 - SDL_log.h: GLib provides a more powerful log implementation (we will, however, provide integration with GLib logging facilities)
 - SDL_system.h: Already provided by GLib
 - SDL_platform.h: Not useful on Vala
 - SDL_endian.h: Already provided by GLib
 - SDL_bits.h: Already provided by GLib
 - SDL_stdinc.h: Already provided by GLib
 - SDL_filesystem.h: Already provided by GLib
