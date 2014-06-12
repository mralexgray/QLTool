
// QLPreviewCont.h QLTool  Created by Tristan Hume on 2014-05-25.  Copyright (c) 2014 Tristan Hume. All rights reserved.

@import QuickLook;
@import Quartz;

@interface QLPreviewCont : NSResponder <QLPreviewPanelDataSource, QLPreviewPanelDelegate>

@property (copy) NSArray *pictures;

-(NSInteger) numberOfPreviewItemsInPreviewPanel:(QLPreviewPanel*)panel;
-(id <QLPreviewItem>) previewPanel:(QLPreviewPanel*)panel previewItemAtIndex:(NSInteger)index;
-              (BOOL) previewPanel:(QLPreviewPanel*)panel        handleEvent:(NSEvent*)event;

@end
