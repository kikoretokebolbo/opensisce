//
//  ComposeForClassController.h
//  openSiS
//
//  Created by os4ed on 1/8/16.
//  Copyright (c) 2016 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeForClassController : UIViewController
@property (strong, nonatomic) NSMutableDictionary *mainDict;
@property (strong, nonatomic) NSString *str_To;
@property (strong, nonatomic) NSString *stradd1;
@property (strong, nonatomic) NSString *str_cc;
@property (strong, nonatomic) NSString *str_prev_cc;
@property (strong, nonatomic) NSString *str_bcc;
@property (strong, nonatomic) NSString *str_prev_bcc;
@property (strong, nonatomic) NSString *userIsEditindToField;

@end
