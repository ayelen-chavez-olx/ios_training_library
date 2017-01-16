Pod::Spec.new do |s|
	
	s.name			= "ios_training_library"
	s.version		= "0.1.0"
	s.summary		= "Summary"
	s. description	= "This is a description"

	s.homepage 		= "www.google.com"
	s.license		= "MIT"
	s.author		= "Ayelen CHavez"

	s.platform		= :ios, "8.0"
	s.source		= { :git => "git@github.com:ayelen-chavez/ios_training_library.git", :tag => s.version }

	s.source_files 	= "Classes", "Classes/**/.{swift}"

	s.frameworks	= "Foundation", "UIKit"
	s.requires_arc 	= true

end