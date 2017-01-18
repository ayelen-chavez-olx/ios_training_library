Pod::Spec.new do |s|
	
	s.name			= "ios_training_library"
	s.version		= "0.1.1"
	s.summary		= "Summary"
	s.description	= "This is a description"

	s.homepage 		= "www.google.com"
	s.license		= "MIT"
	s.author		= "Ayelen CHavez"

	s.platform		= :ios, "8.0"
	s.source		= { :git => "git@github.com:ayelen-chavez/ios_training_library.git", :tag => s.version }

	s.subspec 'Main' do |m|
		m.source_files 	= "Classes/Main/**/*.{swift}"
	end
	
	s.subspec 'Widget' do |w|
		w.source_files 	= "Classes/Widget/**/*.{swift}"
		w.resources 	= "Classes/Widget/Resources/*.{xib}"
		w.dependency "Kingfisher"
	end
	
	s.frameworks	= "Foundation", "UIKit"
	s.requires_arc 	= true

	s.default_subspecs = 'Main'
end