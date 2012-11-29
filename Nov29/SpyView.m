//
//  SpyView.m
//  Nov29
//
//  Created by Lisa Jenkins on 11/28/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import "SpyView.h"

@implementation SpyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor purpleColor];
        destructButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        CGRect b = self.bounds;
        NSString *string = @"Make message self-destruct";
        CGSize length = [string sizeWithFont:[UIFont systemFontOfSize:18]];
        CGSize s = CGSizeMake(length.width*1.2, length.height*1.2);
        
        destructButton.frame = CGRectMake(b.origin.x + (b.size.width - s.width)/2, b.origin.y + (b.size.height - s.height)*7/8, s.width, s.height);
        [destructButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [destructButton setTitle: @"Destroy message" forState:UIControlStateNormal];
        [destructButton addTarget:[UIApplication sharedApplication].delegate action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        
        textView = [[UITextView alloc] initWithFrame:self.frame];
        textView.backgroundColor = [UIColor clearColor];
        textView.font = [UIFont fontWithName:@"AmericanTypewriter" size:20];
        textView.editable = NO;
        textView.text =
        @"Agent Flint: \n"
        @"Your mission is to capture this super spy"
        @" and bring him back to ZOWIE.\n"
        @"Be careful...he is very crafy.";
        
        [self addSubview:textView];
        [self addSubview: destructButton];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIImage *spyImage = [UIImage imageNamed:@"whiteSpy.gif"];
    if (spyImage == nil) {
        NSLog(@"could not find the image");
        return;
    }
    
    CGRect b = self.bounds;
    
    CGPoint point = CGPointMake(b.origin.x + (b.size.width - spyImage.size.width)/2, b.origin.y + (b.size.height - spyImage.size.height)/2);
    
    [spyImage drawAtPoint:point];
}


@end
