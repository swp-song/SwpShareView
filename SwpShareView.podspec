Pod::Spec.new do |s|
  s.name                  = "SwpShareView"
  s.version               = "1.1.3"
  s.ios.deployment_target = '7.0'
  s.summary               = "分享样式 自定义 UI "
  s.homepage              = "https://github.com/swp-song/SwpShareView"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "swp-song" => "396587868@qq.com" }
  s.source                = { :git => "https://github.com/swp-song/SwpShareView.git", :tag => s.version }
  s.requires_arc          = true
  s.source_files          = "SwpShareView/**/*.{h,m}"
  s.resource              = "SwpShareView/SwpShareViewResources/SwpShareView.bundle"
  s.framework             = "UIKit", "Foundation"
  s.dependency "pop"
end
