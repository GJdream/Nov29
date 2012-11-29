//
//  View.h
//  Nov29
//
//  Created by Lisa Jenkins on 11/27/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageView;

@interface View : UIView{
    UIButton *themeButton;
    UIButton *movieButton;
    UIButton *spyViewButton;
    UISwitch *nightSwitch;
    ImageView *blackSpy;
    UILabel *labelForSwitch;
}

-(void) nightVisionOn;
-(void) nightVisionOff;

@end
