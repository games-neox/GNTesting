#
#  Created by Games Neox - 2016
#  Copyright © 2016 Games Neox. All rights reserved.
#

Pod::Spec.new do |s|
s.name             = 'GNTesting'
s.version          = '0.3.0'
s.summary          = 'Asynchronous testing tool for Objective-C/Swift'

s.homepage         = 'https://github.com/games-neox/GNTesting'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Games Neox' => 'games.neox@gmail.com' }
s.source           = { :git => 'https://github.com/games-neox/GNTesting.git', :tag => s.version.to_s }

s.ios.deployment_target = '8.0'

s.dependency 'GNExceptions'
s.dependency 'GNLog'
s.dependency 'GNPreconditions'

s.source_files = 'GNTesting/Classes/*'

s.public_header_files = 'GNTesting/Classes/*.h'
end
