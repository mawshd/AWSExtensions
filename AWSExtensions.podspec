Pod::Spec.new do |s|
  s.name            = 'AWSExtensions'
  s.version         = '1.0.1'
  s.summary         = 'AWSExtensions'
  s.description     = <<-DESC
	TODO: Generic Extensions
DESC

  s.homepage                = 'https://github.com/mawshd/AWSExtensions'
  s.license                 = { :type => 'MIT', :file => 'LICENSE' }
  s.author                  = { 'Awais Shahid' => 'mawshd@gmail.com' }
  s.source                  = { :git => 'https://github.com/mawshd/AWSExtensions.git', :tag => "#{s.version}" }
  s.swift_version           = '4.2'
  s.ios.deployment_target   = '11.0'
  s.source_files            = 'AWSExtensions/Core/**/*.{h,m,swift}'
  
end
