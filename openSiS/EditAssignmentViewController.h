//
//  EditAssignmentViewController.h
//  openSiS
//
//  Created by os4ed on 10/30/15.
//  Copyright © 2015 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+SBJSON.h"
#import "NSObject+SBJSON.h"
#import "Base64.h"
@interface EditAssignmentViewController : UIViewController

{
    
    
    IBOutlet UIButton *save_btn,*save_btn1;
    
}
@property (strong, nonatomic) NSMutableDictionary *dataDIC;
@end
