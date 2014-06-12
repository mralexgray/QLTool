
//  AppDelegate.m  QLTool  Created by Tristan Hume on 2014-05-25.  Copyright (c) 2014 Tristan Hume. All rights reserved.

@import QuickLook;
#import "AppDelegate.h"
#import "ImagePreviewDumper.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification*)n {

    previewFile = [ImagePreviewDumper resolvePath:NSProcessInfo.processInfo.arguments[2]];
    [NSApplication.sharedApplication activateIgnoringOtherApps:YES];
    [self performSelector:@selector(openPanel) withObject:nil afterDelay:0.5];
}

- (void) keyDown:(NSEvent*)e { NSLog(@"key");
    if ([QLPreviewPanel sharedPreviewPanelExists] && [QLPANEL isVisible]) [QLPANEL orderOut:nil];
}

- (BOOL) acceptsPreviewPanelControl:(QLPreviewPanel *)panel {

    return YES;     // without this method then you can’t set a dataSource or delegate
}

-(void) openPanel  {

    [QLPANEL updateController]; //not sure if this is really needed as it should update itself…
    [QLPANEL makeKeyAndOrderFront:nil];
}

-(void) beginPreviewPanelControl:(QLPreviewPanel *)panel {

    //once you’ve acceepted control then you can set up everything else
    [quickLookCont = quickLookCont ?: QLPreviewCont.new setPictures:@[previewFile]]; //this -getTheSelectedPicturesInTheTable is my method that does just that
    [QLPANEL   setDelegate:quickLookCont];
    [QLPANEL setDataSource:quickLookCont];
}

-(void) endPreviewPanelControl:(QLPreviewPanel*)panel { [NSApp terminate:self]; }

@end
