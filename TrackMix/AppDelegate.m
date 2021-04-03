//
//  AppDelegate.m
//  TrackMix
//
//  Created by foo bar on 2/4/20.
//  Copyright © 2020 foo bar. All rights reserved.
//

#import "AppDelegate.h"
#import "Track.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    Track *aTrack = [[Track alloc] init];
    [self setTrack:aTrack];
//    self.track = aTrack; // also valid
    [self updateUserInterface];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)mute:(id)sender {
    NSLog(@"received a mute: message");
    [self.track setVolume:0];
    [self updateUserInterface];
}

- (IBAction)takeFloatValueForVolumeFrom:(id)sender {
    float newValue = [sender floatValue];
    NSString *senderName = nil;
    if (sender == self.slider) {
        senderName = @"slider";
    } else if (sender == self.textField) {
        senderName = @"textField";
    } else {
        NSLog(@"unsupported sender, returning without update");
        return;
    }
    NSLog(@"%@ sent us (%@) a message, their value is %1.2f", senderName, NSStringFromSelector(_cmd), [sender floatValue]);
    [self.track setVolume:newValue];
    [self updateUserInterface];
}

- (void)updateUserInterface {
    float volume = [self.track volume];
    [self.textField setFloatValue:volume];
    [self.slider setFloatValue:volume];
}
@end
