//
//  DBMMediator.h
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DBMScan;

@interface DBMMediator : NSObject

- (DBMScan *)scan;
+ (DBMMediator *)sharedMediator;

@end
