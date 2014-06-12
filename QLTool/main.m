
//  main.m  QLTool  Created by Tristan Hume on 2014-05-25. Copyright (c) 2014 Tristan Hume. All rights reserved.

@import AppKit;
#import "stdio.h"
#import "ImagePreviewDumper.h"

int main(int argc, const char * argv[]) {     //NSLog(@"%s", argv[0]);

  if(argc == 5 && argv[1][0] != 'p') {

      char      command = argv[1][0],
                   mode = argv[1][1];
      NSUInteger  width = atoi(argv[3]),
                 height = atoi(argv[4]);
      BOOL         icon = mode == 'i';
      NSString   * path = [NSString stringWithUTF8String:argv[2]],
                * image = command == 't'
                        ? [ImagePreviewDumper terminalPreviewFor:path ofSize:NSMakeSize(width, height) asIcon:icon]
                        : command == 'd'
                        ? [ImagePreviewDumper dataPreviewFor:path ofSize:NSMakeSize(width, height) asIcon:icon]
                        : @"";

      printf("%s", image.UTF8String);
      fflush(stdout);
      return 0;
  }

  return NSApplicationMain(argc, argv);
}
