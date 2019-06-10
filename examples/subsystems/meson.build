assets_dir =  join_paths(get_option('prefix'), get_option('datadir'), 'assets')

conf_data = configuration_data()
conf_data.set('VERSION', meson.project_version())
conf_data.set('COPYRIGHT_YEARS', '2019')
conf_data.set('ASSETSDIR', assets_dir)

install_data(['font.ttf', 'pic.png', 'sound.ogg'] , install_dir : assets_dir, install: true)
config_file = configure_file(input : 'config.vala.in', output : 'config.vala', configuration : conf_data)

sdl2_subsystems_sources = [
  'multiple_subsystems.vala',
  config_file
]

sdl2_subsystems_deps = [
    glib_dep,
    gobject_dep,
    sdl2_dep,
    sdl2_gfx_dep,
    sdl2_ttf_dep,
    sdl2_image_dep,
    sdl2_mixer_dep
]

executable('sdl2-subsystems', sdl2_subsystems_sources,
  vala_args: '--target-glib=2.58',  dependencies: sdl2_subsystems_deps,
  install: true,
)
