project('sdl2-example', ['c', 'vala'], 
          version: '0.1.0',
    meson_version: '>= 0.49.0',
  default_options: [ 'warning_level=2'],
)

vapi_dir = join_paths(meson.source_root(), 'vapis')

add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

subdir('examples')

valadoc = find_program('valadoc', required: false)

# Valadoc
#if valadoc.found()
#  docdir = join_paths(meson.source_root(), 'doc')
#  doc = custom_target('documentation',
#                      output: docdir,
#                      input: vapi_dir,
#                      command: [valadoc,
#                                '--directory=', docdir,
#                                '--force',
#                                '--package-name=', 'sdl2',
#                                '--package-version=','0.1.0',
#                                '--target-glib=2.58',
#                                '--enable-experimental-non-null',
#                                #'--vapidir=' + vapi_dir,
#                                '--verbose',
#                                '@INPUT@'],
#                      install: false)
#endif
