//
//  DBMMediator.h
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBMScan.h"

@interface DBMMediator : NSObject

@property (nonatomic, copy) NSData *wholeScan;
@property (nonatomic) DBMScan *scan;

- (void)grabWholeScan;
- (void)logWholeScan;
- (void)pushToScan;
- (void)putItAllTogether;

@end
