
source 'https://github.com/aliyun/aliyun-specs.git'

platform :ios, '13.0'

use_frameworks!

# 忽略引入库的所有警告
inhibit_all_warnings!
install! 'cocoapods',
:deterministic_uuids => false,
:disable_input_output_paths => true # 避免Assets.car资源拷贝，引起[CP] Copy Pods Resources编译失败

target 'Demo_carsh' do
  
  pod 'MBProgressHUD', '~> 1.1.0'
  pod 'SnapKit'
  pod 'IQKeyboardManagerSwift'
  
end

target "MainWidgetExtension" do
  pod 'FeedKit'
end


# 描述表收集hook
post_install do |installer|

#  Kingfisher + RealmSwift 移除 swiftui 代码
#  def remove_Kingfisher_swiftui
#   code_file = "./Pods/Kingfisher/Sources/General/KFOptionsSetter.swift"
#    code_text = File.read(code_file)
#    code_text.gsub!(/#if canImport\(SwiftUI\) \&\& canImport\(Combine\)(.|\n)+#endif/,'')
#    file = File.new(code_file, 'w+')
#    file.syswrite(code_text)
#    file.close()
#  end
#  def remove_RealmSwift_swiftui
#    code_file = "./Pods/RealmSwift/RealmSwift/SwiftUI.swift"
#    code_text = File.read(code_file)
#    code_text.gsub!(/#if canImport\(SwiftUI\) \&\& canImport\(Combine\)(.|\n)+#else/,'')
#    code_text = code_text.gsub(/#endif/,'')
#    file = File.new(code_file, 'w+')
#    file.syswrite(code_text)
#    file.close()
#  end
  
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
  
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
