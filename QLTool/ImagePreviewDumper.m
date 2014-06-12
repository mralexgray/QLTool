
//  ImagePreviewDumper.m  QLTool  Created by Tristan Hume on 2014-05-25.  Copyright (c) 2014 Tristan Hume. All rights reserved.

#import "ImagePreviewDumper.h"
#import "NSImage+QuickLook.h"
#import "MF_Base64Additions.h"
#import "stdlib.h"

@implementation ImagePreviewDumper

+ (NSString *)resolvePath:(NSString *)path {

  const char *cpath = [path.stringByStandardizingPath cStringUsingEncoding:NSUTF8StringEncoding];
  char *resolved    = NULL;
  char *returnValue = realpath(cpath, resolved);
/*! @note if there is an error then resolved is set with the path which caused the issue returning nil will prevent further action on this path */
  return returnValue == NULL && resolved != NULL ? printf("Error with path: %s\n", resolved), (id)nil :
    [NSString stringWithCString:returnValue encoding:NSUTF8StringEncoding];
}

+ (NSString*)dataPreviewFor:(NSString*)path ofSize:(NSSize)size asIcon:(BOOL)icon {

    return [NSImage imageWithPreviewOfFileAtPath:[ImagePreviewDumper resolvePath:path]
                                         ofSize:size asIcon:icon].base64ImageData;
}

+ (NSString*)terminalPreviewFor:(NSString*)path ofSize:(NSSize)size asIcon:(BOOL)icon {
    NSString *base64 = [ImagePreviewDumper dataPreviewFor:path ofSize:size asIcon:icon],
             *path64 = path.base64String;
    return [NSString stringWithFormat:@"\033]1337;File=name=%@;size=%lu;inline=1:%@\a\n",
                     path64, (unsigned long)base64.length, base64];
}

@end
