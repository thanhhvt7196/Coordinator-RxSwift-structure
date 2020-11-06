cd `dirname $0`

bundle install --path vendor/bundle
bundle exec pod install
Pods/SwiftGen/bin/swiftgen

