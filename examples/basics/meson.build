sdl2_basics_sources = [
  'basics.vala',
]

sdl2_basics_deps = [
    glib_dep,
    gobject_dep,
    sdl2_dep,
    sdl2_gfx_dep,
    sdl2_image_dep
]

executable('sdl2-basics', sdl2_basics_sources,
  vala_args: '--target-glib=2.58',  dependencies: sdl2_basics_deps,
  install: true,
)
