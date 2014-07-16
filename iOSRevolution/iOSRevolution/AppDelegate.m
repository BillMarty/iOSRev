//
//  AppDelegate.m
//  iOSRevolution
//
//  Created by Sean Marty on 7/15/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import "AppDelegate.h"
#import "DBMMediator.h"
#import "DBMScan.h"
#import "DBMHeader.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    DBMMediator *mediator = [[DBMMediator alloc] init];
    [mediator putItAllTogether];
    
    /*// DONT LEAVE THIS HERE, MOVE IT TO ITS OWN OBJECT SOON
    
    // Create range and buffer for use in grabbing the first 4 bytes
    NSRange range;
    range.location = 0;
    range.length = 4;
    
    unsigned char *charbuffer;
    charbuffer = malloc(100);
    
    unsigned short *shortbuffer;
    shortbuffer = malloc(1000);
    
    // Grab the first 4 bytes of sample, put them in buffer
    [sample getBytes:charbuffer range:range];
    
    // Iterate over buffer and print values of the 4 bytes
    // for (int i = 0; i < 4; i++) {
    //     NSLog(@" %i HEX: %x  DECIMAL: %hhu", i, buffer[i], buffer[i]);
    // }
    
    // Print out the characters for the d B I . part
    for (int i = 0; i < 4; i++) {
        NSString *string = [NSString stringWithFormat:@"%c", charbuffer[i]];
        NSLog(@"%@", string);
    }
    
    // Grab the next 8 bytes in sets of 2
    range.location = 4;
    range.length = 8;
    
    [sample getBytes:shortbuffer range:range];
    
    // Print out the numbers for the read stats section
    for (int i = 0; i < 4; i++) {
        NSLog(@"%i", shortbuffer[i]);
    }
    
    // Testing how I can access the header items
    // unsigned short one = buffer[0];
    // NSLog(@"%x", one);
    */
    
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
