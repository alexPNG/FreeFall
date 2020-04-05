// Bare-bones PSListController header... It compiles, shut up!
#import <UIKit/UIKit.h>

@interface NSTask : NSObject
@property (copy) NSArray *arguments;
@property (copy) NSString *currentDirectoryPath;
@property (copy) NSDictionary *environment;
@property (copy) NSString *launchPath;
@property (readonly) int processIdentifier;
@property (retain) id standardError;
@property (retain) id standardInput;
@property (retain) id standardOutput;
+ (id)currentTaskDictionary;
+ (id)launchedTaskWithDictionary:(id)arg1;
+ (id)launchedTaskWithLaunchPath:(id)arg1 arguments:(id)arg2;
- (id)init;
- (void)interrupt;
- (bool)isRunning;
- (void)launch;
- (bool)resume;
- (bool)suspend;
- (void)terminate;
@end

@interface PSListController: UIViewController{
	NSArray *_specifiers;
}

	@property (nonatomic, retain) id _specifiers;
	- (id)loadSpecifiersFromPlistName:id target:id;
	- (void)setPreferenceValue:(id)arg1 specifier:(id)arg2;
@end

@interface FreeFallPrefsListController: PSListController {
	NSMutableDictionary *prefs;
	NSArray *directoryContent;
	SystemSoundID selectedSound;
}

	- (NSArray *)getValues:(id)target;
	- (void)previewAndSet:(id)value forSpecifier:(id)specifier;
@end