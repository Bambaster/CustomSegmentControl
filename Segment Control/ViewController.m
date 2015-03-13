//
//  ViewController.m
//  Segment Control
//
//  Created by Lowtrack on 25.08.14.
//  Copyright (c) 2014 AR for YOU. All rights reserved.
//

#import "ViewController.h"
#import "AnimationSegment.h"

static float duration = 0.5;


@interface ViewController () {
    
    
    BOOL isFirst;
    BOOL isSecond;
    
    BOOL   isNormalFirst;
    BOOL   isNormalSecond;
    BOOL   isNormalThird;
}


@property (strong, nonatomic) AnimationSegment * changeSegment;
//two sections control
@property (strong, nonatomic) IBOutlet UIView *viewTwoSections;

- (IBAction)FirstSegmentAction:(id)sender;
- (IBAction)SecondSegmentAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *firstSegmentTwo;
@property (strong, nonatomic) IBOutlet UIButton *secondSegmentTwo;



//three sections control

@property (strong, nonatomic) IBOutlet UIView *viewThreeSections;

- (IBAction)actionFirstSegment:(id)sender;
- (IBAction)actionSecoundSegment:(id)sender;
- (IBAction)actionThirdSegment:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *firstOutlet;
@property (strong, nonatomic) IBOutlet UIButton *secondOutlet;
@property (strong, nonatomic) IBOutlet UIButton *thirdOutlet;




@end

@implementation ViewController
@synthesize changeSegment;

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setView];
}

- (void) setView {
    
    changeSegment = [[AnimationSegment alloc] init];
    changeSegment.Duration = duration;
    
    isNormalFirst = NO;
    isNormalSecond = YES;
    isNormalThird = YES;
    isFirst = NO;
    isSecond = YES;
    
    [self setSegmentControlThreeSegment];
    [self setSegmentControlTwoSegment];
    
    dispatch_async(dispatch_get_main_queue(), ^{
    [self changeFirstPressed];
    [self changeSecondNormal];
    [self changeThirdNormal];
    [self setFirst];
    });

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------

- (void) setSegmentControlThreeSegment {
    
    self.viewThreeSections.layer.borderColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0].CGColor;
    self.viewThreeSections.layer.borderWidth = 1;
    self.viewThreeSections.layer.cornerRadius = 5;

    self.firstOutlet.layer.borderWidth = 1;
    self.firstOutlet.layer.cornerRadius = 5;
    self.firstOutlet.layer.borderColor = [UIColor clearColor].CGColor;
    
    self.thirdOutlet.layer.borderWidth = 1;
    self.thirdOutlet.layer.cornerRadius = 5;
    self.thirdOutlet.layer.borderColor = [UIColor clearColor].CGColor;
    
    self.secondOutlet.layer.borderWidth = 1;
    self.secondOutlet.layer.borderColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0].CGColor;
    
    self.secondOutlet.titleLabel.textColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0];
    self.thirdOutlet.titleLabel.textColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0];


}

- (void) setSegmentControlTwoSegment {
    
    self.viewTwoSections.layer.borderColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0].CGColor;
    self.viewTwoSections.layer.borderWidth = 1;
    self.viewTwoSections.layer.cornerRadius = 4;

    
    self.firstSegmentTwo.titleLabel.textColor = [UIColor whiteColor];
    self.secondSegmentTwo.titleLabel.textColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0];
    
    
}

//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------

#pragma mark - Segment Control (3 segments)

- (IBAction)actionFirstSegment:(id)sender {
    
    [self actionFirstSegment];
    
}

- (IBAction)actionSecoundSegment:(id)sender {
    
    [self actionSecondSegment];
    
}

- (IBAction)actionThirdSegment:(id)sender {
    
    [self actionThirdSegment];
    
}

- (void)actionFirstSegment {
    
    if (!isNormalFirst) {
        
        NSLog(@"Allready pressd");
        
    }
    
    else if (isNormalFirst)
    {
        [self changeFirstPressed];
        [self changeSecondNormal];
        [self changeThirdNormal];
        isNormalFirst = NO;
        isNormalSecond = YES;
        isNormalThird = YES;
        
        
        NSLog(@"actionFirstSegment");

        
    }
    
    
    
}

- (void) actionSecondSegment {
    
    if (!isNormalSecond) {
        
        NSLog(@"Allready pressd");
        
    }
    
    else if (isNormalSecond)
    {
        [self changeFirstNormal];
        [self changeSecondPressed];
        [self changeThirdNormal];
        isNormalFirst = YES;
        isNormalSecond = NO;
        isNormalThird = YES;
        
        NSLog(@"actionSecondSegment");

    }
    
    
    
}

- (void) actionThirdSegment {
    
    
    
    if (!isNormalThird) {
        
        NSLog(@"Allready pressd");
        
    }
    
    else if (isNormalThird)
    {
        [self changeFirstNormal];
        [self changeSecondNormal];
        [self changeThirdPressed];
        isNormalFirst = YES;
        isNormalSecond = YES;
        isNormalThird = NO;
        
        NSLog(@"actionThirdSegment");

        
    }
    
}

//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------

- (void) changeFirstPressed {
    
    changeSegment.segmentButton = self.firstOutlet;
    changeSegment.segmentButtonTextColor = [UIColor whiteColor];
    changeSegment.segmentButtonBGColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0];
    
    [changeSegment changeSegment];

    
}

- (void) changeSecondPressed {
    
    changeSegment.segmentButton = self.secondOutlet;
    changeSegment.segmentButtonTextColor = [UIColor whiteColor];
    changeSegment.segmentButtonBGColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0];
    [changeSegment changeSegment];

}

- (void) changeThirdPressed {
    
    changeSegment.segmentButton = self.thirdOutlet;
    changeSegment.segmentButtonTextColor = [UIColor whiteColor];
    changeSegment.segmentButtonBGColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0];
    [changeSegment changeSegment];

}



- (void) changeFirstNormal {
    
    changeSegment.segmentButton = self.firstOutlet;
    changeSegment.segmentButtonTextColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0];
    changeSegment.segmentButtonBGColor = [UIColor whiteColor];
    
    [changeSegment changeSegment];

}

- (void) changeSecondNormal {
    
    changeSegment.segmentButton = self.secondOutlet;
    changeSegment.segmentButtonTextColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0];
    changeSegment.segmentButtonBGColor = [UIColor whiteColor];
    [changeSegment changeSegment];

}

- (void) changeThirdNormal {
    
    changeSegment.segmentButton = self.thirdOutlet;
    changeSegment.segmentButtonTextColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0];
    changeSegment.segmentButtonBGColor = [UIColor whiteColor];
    [changeSegment changeSegment];

}

//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------

#pragma mark - Segment Control (2 segments)


- (IBAction)FirstSegmentAction:(id)sender {
    
    
    if (isFirst) {
        
        [self setFirst];
        
        isFirst = NO;
        isSecond = YES;
        
        NSLog(@"FirstSegmentAction");

    }
    
    
}

- (IBAction)SecondSegmentAction:(id)sender {
    
    if (isSecond) {
        
        
        [self setSecond];
        
        isFirst = YES;
        isSecond = NO;
        
        NSLog(@"SecondSegmentAction");

        
    }
    
}

//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------

- (void) setFirst {
    
    changeSegment.segmentButton = self.firstSegmentTwo;
    changeSegment.segmentButtonTextColor = [UIColor whiteColor];
    changeSegment.segmentButtonBGColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0];
    [changeSegment changeSegment];

    
    changeSegment.segmentButton = self.secondSegmentTwo;
    changeSegment.segmentButtonTextColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0];
    changeSegment.segmentButtonBGColor = [UIColor whiteColor];
    
    [changeSegment changeSegment];
    
}

- (void) setSecond {
    
    changeSegment.segmentButton = self.secondSegmentTwo;
    changeSegment.segmentButtonTextColor = [UIColor whiteColor];
    changeSegment.segmentButtonBGColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0];
    [changeSegment changeSegment];

    changeSegment.segmentButton = self.firstSegmentTwo;
    changeSegment.segmentButtonTextColor = [UIColor colorWithRed:61.0/255.0 green:71.0/255.0 blue:81.0/255.0 alpha:1.0];
    changeSegment.segmentButtonBGColor = [UIColor whiteColor];
    
    [changeSegment changeSegment];
    
}





@end
