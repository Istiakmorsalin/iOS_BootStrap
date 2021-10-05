platform :ios, '10.0'

def shared_pods
  use_frameworks!

  pod 'RxSwift', '4.3.1'
  pod 'RxCocoa', '4.3.1'
  pod 'RxFlow', '1.6.0'
  pod 'Reusable', '4.0.3'
  pod 'RxDataSources', '3.1.0'
  pod 'SwiftLint', '0.27.0'
  pod 'Alamofire', '4.7.3'
  pod 'XCGLogger', '~> 7.0.1'
  pod 'Kingfisher', '~> 5.0'
  pod 'Firebase/Core'
  pod 'Firebase/DynamicLinks'
  pod 'Google-Mobile-Ads-SDK'
  pod 'KeychainAccess', '3.1.1'
  pod 'AMScrollingNavbar', '5.1.0'
  pod 'SnapKit', '4.0.1'
  pod 'IQKeyboardManagerSwift', '6.1.1'
  pod 'SkeletonView', '1.4.0'
  pod 'RxGesture', '2.0.1'
  pod 'Gifu', '3.2.0'
  pod 'Firebase/Messaging'
  pod 'CryptoSwift', '0.12.0'
  pod 'UITextView+Placeholder'
  pod 'XLPagerTabStrip', '8.0.1'
  pod 'ReachabilitySwift'
end

target 'dev' do
  shared_pods
end

target 'stg' do
    shared_pods
end

target 'prod' do
    shared_pods
end

post_install do |installer|
    SWIFT_4_2_PODS = %w[Gifu DropDown]

    installer.pods_project.targets.each do |target|
        if target.name == 'RxSwift'
            target.build_configurations.each do |config|
                if config.name == 'Debug'
                    config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
                end
            end
        end

        if SWIFT_4_2_PODS.include?(target.name)
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.2'
            end
        end
    end
end
