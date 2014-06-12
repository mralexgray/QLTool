//
//  ImagePreviewDumper.h
//  QLTool
//
//  Created by Tristan Hume on 2014-05-25.
//  Copyright (c) 2014 Tristan Hume. All rights reserved.
//

@import Foundation;

#define QLPANEL QLPreviewPanel.sharedPreviewPanel

@interface ImagePreviewDumper : NSObject

+ (NSString*)     dataPreviewFor:(NSString*)p ofSize:(NSSize)z asIcon:(BOOL)i;
+ (NSString*) terminalPreviewFor:(NSString*)p ofSize:(NSSize)z asIcon:(BOOL)i;
+ (NSString*)        resolvePath:(NSString*)p;

@end
