Pod::Spec.new do |s|
  s.name         = "Notie"
  s.version      = "1.0.0"
  s.summary      = "Undistracted in-app notification in Swift, with added buttons and input box."
  s.homepage     = "https://github.com/thii/Notie"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { " " => "t@thi.im" }
  s.source       = { :git => "https://github.com/thii/Notie.git", :tag => s.version.to_s }
  s.platform      = :ios, '9.0'
  s.requires_arc = true
  s.ios.deployment_target = "9.0"
  s.source_files = "Notie/*.{h,swift}"
end
