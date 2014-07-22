//
//  DBMMediator.h
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBMMediator : NSObject

@property (nonatomic) NSMutableData *wholeScan;
@property (nonatomic) unsigned long wholeScanLength;

- (void)grabWholeScan;
- (void)logWholeScan;


@end
