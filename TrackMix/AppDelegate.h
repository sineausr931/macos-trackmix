//
//  AppDelegate.h
//  TrackMix
//
//  Created by foo bar on 2/4/20.
//  Copyright © 2020 foo bar. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Track;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong) Track *track;

@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSSlider *slider;

- (IBAction)mute:(id)sender;
- (IBAction)takeFloatValueForVolumeFrom:(id)sender;
- (void)updateUserInterface;
@end
