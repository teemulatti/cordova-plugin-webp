//  This Source Code Form is subject to the terms of the Mozilla Public
//  License, v. 2.0. If a copy of the MPL was not distributed with this
//  file, You can obtain one at http://mozilla.org/MPL/2.0/.
//
//  Copyright (c) 2013-2014 Scott Talbot.

#import <Foundation/Foundation.h>

#import "STWebP.h"

@interface STWebPDecoder : NSObject

+ (UIImage *)imageWithData:(NSData *)data error:(NSError * __autoreleasing *)error;
+ (UIImage *)imageWithData:(NSData *)data scale:(CGFloat)scale error:(NSError * __autoreleasing *)error;

@end
