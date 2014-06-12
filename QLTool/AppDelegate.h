
//  AppDelegate.h  QLTool Created by Tristan Hume on 2014-05-25.  Copyright (c) 2014 Tristan Hume. All rights reserved.


#import "QLPreviewCont.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    QLPreviewCont * quickLookCont;
         NSString * previewFile;
}

- (void) keyDown:(NSEvent*)e;

@end
