//
//  NSFileManager+Paths.h
//  YLGL
//
//  Created by Fascinate on 2019/4/23.
//  Copyright © 2019 GF. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (Paths)

+ (NSURL *)documentsURL;
+ (NSString *)documentsPath;


+ (NSURL *)libraryURL;
+ (NSString *)libraryPath;


+ (NSURL *)cachesURL;
+ (NSString *)cachesPath;


+ (BOOL)addSkipBackupAttributeToFile:(NSString *)path;

+ (double)availableDiskSpace;

+ (NSString *)pathUserChatVoice:(NSString *)voiceName;
@end

NS_ASSUME_NONNULL_END
