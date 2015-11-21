Pod::Spec.new do |s|
  s.name         = "Notie"
  s.version      = "0.1.0"
  s.source_files = "Notie/*.{h,swift}"
  s.requires_arc = true
  s.ios.deployment_target = "8.0"
end
