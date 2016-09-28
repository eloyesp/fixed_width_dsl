Gem::Specification.new do |s|
  s.name        = 'fixed_width_dsl'
  s.version     = '0.1.1'
  s.summary     = 'DSL to build readable format strings'
  s.description = 'A DSL to build and use format/sprintf etc without' \
                  ' readability issues'
  s.authors     = ['Eloy Espinaco']
  s.email       = 'eloyesp@gmail.com'
  s.files       = ["lib/fixed_width_dsl.rb"]
  s.homepage    = 'https://github.com/eloyesp/fixed_width_dsl'
  s.license     = 'AGPL-3.0+'

  s.add_development_dependency 'cutest', '~> 1.0'
end
