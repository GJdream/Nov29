//
//  View.m
//  Nov29
//
//  Created by Lisa Jenkins on 11/27/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import "View.h"
#import "ImageView.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        themeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        movieButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        spyViewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        nightSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
        if (nightSwitch == nil) {
            return nil;
        }
        
        CGRect b = self.bounds;
        CGSize s = CGSizeMake(200, 40);
        
        themeButton.frame = CGRectMake(
                                  b.origin.x + (b.size.width - s.width)/2,
                                  b.origin.y + (b.size.height)/6 - s.height,
                                  s.width,
                                  s.height
                                  );
        
        movieButton.frame = CGRectMake(
                                       b.origin.x + (b.size.width - s.width)/2,
                                       b.origin.y + (b.size.height)/3 - s.height,
                                       s.width,
                                       s.height
                                       );
        spyViewButton.frame = CGRectMake(
                                         b.origin.x + (b.size.width - s.width)/2,
                                         b.origin.y + (b.size.height)/2 - s.height,
                                         s.width,
                                         s.height
                                         );
      
        nightSwitch.center = CGPointMake(
                                         b.origin.x + (b.size.width - nightSwitch.frame.size.width)/2,
                                         b.origin.y + (b.size.height - nightSwitch.frame.size.height)*2/3);
        
        [themeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [movieButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [spyViewButton setTitleColor: [UIColor redColor] forState:UIControlStateNormal];
        
        [themeButton setTitle: @"Play your theme song" forState:UIControlStateNormal];
        [movieButton setTitle: @"See how it's done" forState:UIControlStateNormal];
        [spyViewButton setTitle: @"Review your mission" forState:UIControlStateNormal];
        
        [themeButton
         addTarget:[UIApplication sharedApplication].delegate
                   action:@selector(touchUpInside:)
         forControlEvents:UIControlEventTouchUpInside
         ];
        
        [movieButton
         addTarget:[UIApplication sharedApplication].delegate
         action:@selector(touchUpInside:)
         forControlEvents:UIControlEventTouchUpInside];
        
        [spyViewButton
         addTarget:[UIApplication sharedApplication].delegate
         action:@selector(touchUpInside:)
         forControlEvents:UIControlEventTouchUpInside];
        
        [nightSwitch
         addTarget:[UIApplication sharedApplication].delegate
         action:@selector(valueChanged:)
         forControlEvents:UIControlEventValueChanged];
        nightSwitch.on = NO;
        
        NSString *labelText = @"Night Vision Switch";
        UIFont *font = [UIFont systemFontOfSize:16];
        CGSize labelSize = [labelText sizeWithFont: font];
        CGRect labelRect = CGRectMake(
                                      b.origin.x + (b.size.width + nightSwitch.frame.size.width - labelSize.width/2)/2,
                                      b.origin.y + (b.size.height -nightSwitch.bounds.size.height*1.5)*2/3,
                                      labelSize.width,
                                      labelSize.height);
        labelForSwitch = [[UILabel alloc] initWithFrame:labelRect];
        labelForSwitch.font = font;
        labelForSwitch.text = labelText;
        labelForSwitch.textColor = [UIColor redColor];
        labelForSwitch.backgroundColor = [UIColor clearColor];
        
        blackSpy = [[ImageView alloc] initWithView:self];
        blackSpy.center = CGPointMake(
                                      b.origin.x + (b.size.width - blackSpy.bounds.size.width)/2,
                                      b.origin.y + (b.size.height - blackSpy.bounds.size.height));
        blackSpy.hidden = YES;
        
        [self addSubview:themeButton];
        [self addSubview:movieButton];
        [self addSubview:spyViewButton];
        [self addSubview:nightSwitch];
        [self addSubview:blackSpy];
        [self addSubview:labelForSwitch];
        
    }
    return self;
}

-(void) nightVisionOn {
    self.backgroundColor = [UIColor blackColor];
    
    [themeButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    [movieButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    [spyViewButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    labelForSwitch.textColor = [UIColor greenColor];
    
    blackSpy.hidden = NO;
    
}

-(void) nightVisionOff {
    self.backgroundColor = [UIColor whiteColor];
    
    [themeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

    [movieButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

    [spyViewButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    labelForSwitch.textColor = [UIColor redColor];
    
    blackSpy.hidden = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    
}
*/

@end
