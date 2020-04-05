#import <AudioToolbox/AudioToolbox.h>
#import "FreeFallPrefs.h"

@implementation FreeFallPrefsListController

- (id)init {
  self = [super init];
  if (self) {
    UIBarButtonItem *respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStylePlain target:self action:@selector(respring)];
    self.navigationItem.rightBarButtonItem = respringButton;
  }
  return self;
}

- (void)Twitter {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/its_alex_png"] options:@{} completionHandler:nil];
}
- (void)Repository {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://alexpng.github.io"] options:@{} completionHandler:nil];
}
- (void)GitHub {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/alexPNG"] options:@{} completionHandler:nil];
}
- (void)Email {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:alex.png.cc@gmail.com"] options:@{} completionHandler:nil];
}
- (void)Reddit {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://reddit.com/user/alex_png"] options:@{} completionHandler:nil];
}

- (void)respring {
  NSTask *task = [[[NSTask alloc] init] autorelease];
  [task setLaunchPath:@"/usr/bin/killall"];
  [task setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
  [task launch];
}

	// Load the two PSLinkListCells
	- (id)specifiers{
		// Load directory content
		directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/FreeFall" error:NULL];
	
		if(_specifiers == nil) {
			_specifiers=[[self loadSpecifiersFromPlistName:@"FreeFallPrefs" target:self] retain];
		}
	
		return _specifiers;
	}
	
	// Preview the sound before setting
	- (void)previewAndSet:(id)value forSpecifier:(id)specifier{
		// Sample sound and set
		AudioServicesDisposeSystemSoundID(selectedSound);
		AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/FreeFall/%@",value]],&selectedSound);
		AudioServicesPlaySystemSound(selectedSound);
		
		[super setPreferenceValue:value specifier:specifier];
	}

	// List our directory content
	- (NSArray *)getValues:(id)target{
		return [[NSArray arrayWithObjects:@"None",nil] arrayByAddingObjectsFromArray:directoryContent];
	}

	
@end
