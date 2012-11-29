//
//  ImageView.m
//  Nov29
//
//  Created by Lisa Jenkins on 11/28/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import "ImageView.h"
#import "View.h"

@implementation ImageView

- (id)initWithView: (View *) v
{
    UIImage *image = [UIImage imageNamed:@"blackSpy.gif"];
    if (image == nil) {
        NSLog(@"could not find the imagefile");
    }
    
    self = [super initWithImage:image];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
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
