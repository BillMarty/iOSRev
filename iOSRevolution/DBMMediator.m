//
//  DBMMediator.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "DBMMediator.h"
#import "DBMScan.h"

@implementation DBMMediator

- (DBMScan *)scan
{
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"20140521Firstvolume.bin" ofType:nil];
    NSData *scanData = [NSData dataWithContentsOfFile:filepath];
    return [DBMScan scanWithData:scanData];
}

+ (DBMMediator *)sharedMediator
{
    static DBMMediator *result;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        result = [[DBMMediator alloc] init];
    });
    return result;
}


@end
