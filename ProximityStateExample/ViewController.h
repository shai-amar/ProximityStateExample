//
//  ViewController.h
//  ProximityStateExample
//
//  Created by Shai Amar on 01/08/2016.
//  Copyright © 2016 Shai Amar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//  This label shows if the proximity state is enabled
@property (weak, nonatomic) IBOutlet UILabel *proximityStateEnabledLabel;



@property (strong, nonatomic) NSString *proximityStateEnabledMsg;




@end

