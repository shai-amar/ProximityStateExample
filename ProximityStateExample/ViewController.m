//
//  ViewController.m
//  ProximityStateExample
//
//  Created by Shai Amar on 01/08/2016.
//  Copyright © 2016 Shai Amar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize proximityStateEnabledLabel = _proximityStateEnabledLabel;

@synthesize proximityStateEnabledMsg = _proximityStateEnabledMsg;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.proximityStateEnabledLabel.text = @"";
    
    self.proximityStateEnabledMsg = @"";
    
    //  Enable the proximity sensor (default value: NO)
    [[UIDevice currentDevice] setProximityMonitoringEnabled:YES];
    
    //  Setup an observer for sensor change
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(sensorStateMonitor:) name:@"UIDeviceProximityStateDidChangeNotification"
                                               object:nil];
    
    if([[UIDevice currentDevice] isProximityMonitoringEnabled])
    {   //  If this value is YES, proximity sensor is supported by this device
        self.proximityStateEnabledMsg = @"Proximity state sensor is supported";
    }
    else
    {   //  //  If this value remains NO, proximity sensor is NOT supported by this device
        self.proximityStateEnabledMsg = @"proximity state sensor is NOT supported";
    }
    
}

#pragma mark - Setters & Getters

- (void)setProximityStateEnabledMsg:(NSString *)proximityStateEnabledMsg {
    _proximityStateEnabledMsg = proximityStateEnabledMsg;
    
    _proximityStateEnabledLabel.text = proximityStateEnabledMsg;
    [_proximityStateEnabledLabel setNeedsDisplay];
}


#pragma mark - Proximity

- (void)sensorStateMonitor:(NSNotificationCenter *)notification
{
    if ([[UIDevice currentDevice] proximityState] == YES)
    {
        NSLog(@"The Object is close to device.");
    }
    
    else
    {
        NSLog(@"The object is NOT closer to device.");
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
