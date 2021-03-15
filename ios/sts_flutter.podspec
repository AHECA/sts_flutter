#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint sts_flutter.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'sts_flutter'
  s.version          = '0.0.18'
  s.summary          = 'AHCA STS Flutter plugin.'
  s.description      = <<-DESC
AHCA STS Flutter plugin.
                       DESC
  s.homepage         = 'https://github.com/AHECA/sts_flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'AHECA' => 'ahca_developer@163.com' }
  s.source           = { :path => '.' }
  s.ios.vendored_frameworks = 'Frameworks/AnXinSDK.framework'
  s.vendored_frameworks = 'AnXinSDK.framework'
  s.libraries = 'c++'
  s.ios.resource = 'Frameworks/AXShieldBundle.bundle'
  s.resource = 'AXShieldBundle.bundle'
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
