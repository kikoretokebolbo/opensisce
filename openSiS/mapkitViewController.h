//
//  mapkitViewController.h
//  openSiS
//
//  Created by EjobIndia on 08/01/16.
//  Copyright (c) 2016 openSiS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface mapkitViewController : UIViewController
{

    IBOutlet MKMapView *mapview;
    IBOutlet UILabel *lbl_name;

}

@property(strong,nonatomic)NSString *str_address,*str_name;

@end
