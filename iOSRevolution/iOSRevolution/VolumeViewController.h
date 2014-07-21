//
//  VolumeViewController.h
//  iOSRevolution
//
//  Created by Sean Marty on 7/16/14.
//  Copyright (c) 2014 dBMEDx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VolumeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *volumeNumDisplay;
@property (nonatomic) unsigned short volume3DVVC;

@end