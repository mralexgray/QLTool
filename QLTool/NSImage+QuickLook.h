//
//  NSImage+QuickLook.h
//  QuickLookTest
//
//  Created by Matt Gemmell on 29/10/2007.
//

@import AppKit;

@interface NSImage (QuickLook)

+ (NSImage *)imageWithPreviewOfFileAtPath:(NSString *)path ofSize:(NSSize)size asIcon:(BOOL)icon;

@property (readonly) NSString * base64ImageData;
@property (readonly)   NSData * PNGRepresentation;


@end
