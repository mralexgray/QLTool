
//  QLPreviewCont.m  QLTool  Created by Tristan Hume on 2014-05-25.  Copyright (c) 2014 Tristan Hume. All rights reserved.

#import "QLPreviewCont.h"
#import "AppDelegate.h"

@implementation QLPreviewCont

/*!

- (void) setPictures:(NSArray*)theArray {
    [pictures removeAllObjects];
    [pictures setArray:theArray];
} 
  */

- (NSInteger)numberOfPreviewItemsInPreviewPanel:(QLPreviewPanel *)panel {

  return (_pictures = _pictures ?: @[]).count; // Quick Look panel data source
}

- (id <QLPreviewItem>)previewPanel:(QLPreviewPanel *)panel previewItemAtIndex:(NSInteger)index {

  return [NSURL fileURLWithPath:(_pictures = _pictures ?: @[])[index]];    //I’m going to assume that you’ve stored the NSURL’s as strings…
}

// Quick Look panel delegate
- (BOOL)previewPanel:(QLPreviewPanel*)panel handleEvent:(NSEvent*)event {

    return event.type ==  NSKeyDown     // redirect all key down events to the table view
                      ?   [(id)[NSApplication.sharedApplication delegate] keyDown:event], YES
                      :   NO;
}

@end
  