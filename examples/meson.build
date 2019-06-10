glib_dep = dependency('glib-2.0')
gobject_dep = dependency('gobject-2.0')
sdl2_dep = dependency('sdl2')
sdl2_gfx_dep = dependency('SDL2_gfx')
sdl2_ttf_dep = dependency('SDL2_ttf')
sdl2_image_dep = dependency('SDL2_image')
sdl2_mixer_dep = dependency('SDL2_mixer')

vapi_dir = meson.source_root() / 'vapis'

add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

subdir('basics')
subdir('subsystems')
