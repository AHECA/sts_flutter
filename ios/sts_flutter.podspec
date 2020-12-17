#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint sts_flutter.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'sts_flutter'
  s.version          = '0.0.1'
  s.summary          = 'AHCA STS Flutter plugin.'
  s.description      = <<-DESC
AHCA STS Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.ios.vendored_frameworks = 'Frameworks/AnXinSDK.framework'
  s.vendored_frameworks = 'AnXinSDK.framework'
  s.resources = 'Frameworks/AXShieldBundle.bundle'
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
