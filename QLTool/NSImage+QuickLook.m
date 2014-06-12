//
//  NSImage+QuickLook.m
//  QuickLookTest
//
//  Created by Matt Gemmell on 29/10/2007.
//

#import "NSImage+QuickLook.h"
#import "MF_Base64Additions.h"

@import QuickLook; // Make sure modules are enabled, andyou can remove all reerences to liking o frameworks!

@implementation NSImage (QuickLook)


+ (NSImage *)imageWithPreviewOfFileAtPath:(NSString *)path ofSize:(NSSize)size asIcon:(BOOL)icon
{
    NSURL *fileURL = [NSURL fileURLWithPath:path];
    if (!path || !fileURL) {
        return nil;
    }
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:icon] 
                                                     forKey:(NSString *)kQLThumbnailOptionIconModeKey];
    CGImageRef ref = QLThumbnailImageCreate(kCFAllocatorDefault, 
                                            (__bridge CFURLRef)fileURL, 
                                            CGSizeMake(size.width, size.height),
                                            (__bridge CFDictionaryRef)dict);
    
    if (ref != NULL) {
        // Take advantage of NSBitmapImageRep's -initWithCGImage: initializer, new in Leopard,
        // which is a lot more efficient than copying pixel data into a brand new NSImage.
        // Thanks to Troy Stephens @ Apple for pointing this new method out to me.
        NSBitmapImageRep *bitmapImageRep = [[NSBitmapImageRep alloc] initWithCGImage:ref];
        NSImage *newImage = nil;
        if (bitmapImageRep) {
            newImage = [[NSImage alloc] initWithSize:[bitmapImageRep size]];
            [newImage addRepresentation:bitmapImageRep];
            //[bitmapImageRep release];
            
            if (newImage) {
                return newImage;
            }
        }
        CFRelease(ref);
    } else {
        // If we couldn't get a Quick Look preview, fall back on the file's Finder icon.
        NSImage *icon = [[NSWorkspace sharedWorkspace] iconForFile:path];
        if (icon) {
            [icon setSize:size];
        }
        return icon;
    }
    
    return nil;
}

- (NSString*)base64ImageData { return self.PNGRepresentation.base64String; }

- (NSData *)PNGRepresentation {
    // Create a bitmap representation from the current image
    [self lockFocus];
    NSBitmapImageRep *bitmapRep = [NSBitmapImageRep.alloc initWithFocusedViewRect:(NSRect){0, 0,self.size}];
    [self unlockFocus];
    return [bitmapRep representationUsingType:NSPNGFileType properties:Nil];
}


@end
