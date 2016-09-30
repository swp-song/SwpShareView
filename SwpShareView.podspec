Pod::Spec.new do |s|
  s.name                  = "SwpShareView"
  s.version               = "1.0.0"
  s.ios.deployment_target = '7.0'
  s.summary               = " 简单 自定义 分享样式 "
  s.homepage              = "https://github.com/swp-song/SwpShareView"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "swp-song" => "396587868@qq.com" }
  s.source                = { :git => "https://github.com/swp-song/SwpShareView.git", :tag => s.version }
  s.source_files          = "SwpShareView"
  s.requires_arc          = true
  s.resource              = "SwpShareView/Resources/SwpShareView.bundle"
  s.framework             = "UIKit", "Foundation"
  s.dependency "pop"
end