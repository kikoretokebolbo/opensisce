//
//  EditNewAssignmentViewController.h
//  openSiS
//
//  Created by os4ed on 11/2/15.
//  Copyright © 2015 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditNewAssignmentViewController : UIViewController
{
    NSString *assign_flag,*due_flag;
    NSString *assign_date,*due_date,*pick_id;
    NSMutableArray *ary_id,*ARY_PICK_TITLE;
}
@property (strong, nonatomic) NSMutableDictionary *dict_main;

@end
