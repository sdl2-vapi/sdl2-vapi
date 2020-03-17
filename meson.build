project('sdl2-vapi', ['c', 'vala'],
          version: '2.0.5',
    meson_version: '>= 0.49.0',
  default_options: [ 'warning_level=2'],
)

vapi_dir = join_paths(meson.source_root(), 'vapis')

add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

subdir('examples')

docs_enabled = get_option('docs')

valadoc = find_program('valadoc', required: docs_enabled)

if docs_enabled
  subdir('docs')
endif

