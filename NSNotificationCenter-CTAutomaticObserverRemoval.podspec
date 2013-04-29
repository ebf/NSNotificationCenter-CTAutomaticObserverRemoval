Pod::Spec.new do |spec|
  spec.name         = 'NSNotificationCenter-CTAutomaticObserverRemoval'
  spec.version      = '0.1.1'
  spec.platform     = :ios, '5.0'
  spec.license      = 'MIT'
  spec.source       = { :git => 'https://github.com/ebf/NSNotificationCenter-CTAutomaticObserverRemoval.git', :tag => spec.version.to_s }
  spec.source_files = 'NSNotificationCenter-CTAutomaticObserverRemoval/NSNotificationCenter-CTAutomaticObserverRemoval/*.{h,m}'
  spec.frameworks   = 'Foundation'
  spec.requires_arc = true
  spec.homepage     = 'https://github.com/ebf/NSNotificationCenter-CTAutomaticObserverRemoval'
  spec.summary      = 'NSNotificationCenter with automatic observer removal.'
  spec.author       = { 'Oliver Letterer' => 'oliver.letterer@gmail.com' }
end