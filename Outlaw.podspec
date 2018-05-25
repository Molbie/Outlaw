Pod::Spec.new do |s|
  s.name						= "Outlaw"
  s.version						= "2.0.0"
  s.summary						= "Outlaw is a simple, lightweight framework for safely extracting values from [String: Any]"
  s.description					= <<-DESC
                   					In Swift, we all deal with JSON, plists, and various forms of [String: Any]. Outlaw provides various ways to deal with these in an expressive and type safe way. Outlaw will help you write declarative, performant, error handled code using the power of Protocol Oriented Programming™.
                   				  DESC
  s.homepage					= "https://github.com/Molbie/Outlaw"
  s.license						= "MIT"
  s.author						= "bmullen@molbie.co"
  s.osx.deployment_target		= "10.9"
  s.ios.deployment_target		= "8.0"
  s.tvos.deployment_target		= "9.0"
  s.watchos.deployment_target	= "2.0"
  s.source						= { :git => "https://github.com/Molbie/Outlaw.git",
									:tag => s.version.to_s }
  s.source_files				= "Sources/Outlaw/**/*.swift"
  s.requires_arc				= true
  s.module_name					= "Outlaw"
end
