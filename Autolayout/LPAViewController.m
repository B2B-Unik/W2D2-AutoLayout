//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView *                framingView;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;
    
//-------------------- PurpleView ------------------------------------------------------

/* To start, we create a new UIView and set its frame to CGRectZero. We could have made the box with fixed values ex) CGRectMake(0, 0, 100, 50). This creates a box at (0,0) x,y coordinates and with 100 width and 50 height. However, we want to create something with dynamic properties. Notice that for the purple box x,y and width all change depending on if you are in square, potrait, or landscape mode. To make our size dynamic we set the frame to CGRectZero, which is empty box (equivalent to CGRectMake(0, 0, 0, 0)), and we assign layout constraits to change our x,y, and width depending on framingView's properties (which we framingView's size in resizeFramingView:)
     
    Then we set translatesAutoresizingMaskIntoConstraints to NO
     
    Set the view's background colour to purple
     
    And add the purple box to our view.
     
    Next, we will add 4 constraints (using NSLayoutConstraint constraintWithItem).
     
    One constraint will set the purple box's right margin equal to a 20 points offset to framingView's right margin
    One constraint will set the purple box's bottom margin equal to a 20 points offset to framingView's bottom margin
    One constraint will set the width of purple box to (305.0/500.0) of the framingView's width. Use the multipler property to set this.
    One constraint will set the height of purple box to a fixed size of 50 points. Since this constraint is not in relation to another our View, set toItem to nil and toItem's attribute to NSLayoutAttributeNotAnAttribute. */
    
    
    UIView *purpleView = [[UIView alloc] initWithFrame:CGRectZero]; // Created a new UIView instance with frame Zero
    purpleView.translatesAutoresizingMaskIntoConstraints = NO;      // Disabled auto resizing translation
    purpleView.backgroundColor = [UIColor purpleColor];             // Set purpleView background color to UIColor purple
    [self.framingView addSubview:purpleView];                       // Added the purpleView as a subview of framingView
    
    // Added constraint to set purple box's right margin equal to a 20 points offset
    // to frameView's right margin.
    NSLayoutConstraint *purpleRightMargin = [NSLayoutConstraint constraintWithItem:purpleView
                                                                         attribute: NSLayoutAttributeRightMargin
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.framingView
                                                                         attribute:NSLayoutAttributeRightMargin
                                                                        multiplier:1.0
                                                                          constant:-20];
    
    // Added constraint to set purple box's bottom margin equal to a 20 points offset
    // to frameView's bottom margin.
    NSLayoutConstraint *purpleBottomMargin = [NSLayoutConstraint constraintWithItem:purpleView
                                                                          attribute: NSLayoutAttributeBottomMargin
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.framingView
                                                                          attribute:NSLayoutAttributeBottomMargin
                                                                         multiplier:1.0
                                                                           constant:-20];

    // Added constraint to set purple box's width to (305.0/500.0) of the framingView's width.
    NSLayoutConstraint *purpleWidth = [NSLayoutConstraint constraintWithItem:purpleView
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.framingView
                                                                   attribute:NSLayoutAttributeWidth
                                                                  multiplier:(305.0/500.0)
                                                                    constant:0];
    
    // Add constraint to set purple's box height to fixed size of 50.0 points.
    // Since the constraint is not in relation to another of our View, set "toItem" to nil and "toItem's attribute"
    // to NSLayoutAttributeNotAnAttribute.
    NSLayoutConstraint *purpleHeight = [NSLayoutConstraint constraintWithItem:purpleView
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1.0
                                                                     constant:50];
    
    [self.view addConstraints:@[purpleRightMargin, purpleBottomMargin, purpleWidth, purpleHeight]];

    //-------------------- RedView ------------------------------------------------------
    
    /* The red box is positioned with its edges 20 points away from the top and right edges of the green box. */
    
        UIView *redView = [[UIView alloc] initWithFrame:CGRectZero];
        redView.translatesAutoresizingMaskIntoConstraints = NO;
        redView.backgroundColor = [UIColor redColor];
        [self.framingView addSubview:redView];
    
        NSLayoutConstraint *redTop = [NSLayoutConstraint constraintWithItem:redView
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:framingView
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1.0
                                                                   constant:20];
    
        NSLayoutConstraint *redTrailing = [NSLayoutConstraint constraintWithItem:redView
                                                                       attribute:NSLayoutAttributeTrailing
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:framingView
                                                                       attribute:NSLayoutAttributeTrailing
                                                                      multiplier:1.0
                                                                        constant:-20];
    
        NSLayoutConstraint *redWidth = [NSLayoutConstraint constraintWithItem:redView
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:144];
    
        NSLayoutConstraint *redHeight = [NSLayoutConstraint constraintWithItem:redView
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:nil
                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                               multiplier:1.0
                                                                 constant:46];

    
        [self.view addConstraints:@[redTop, redTrailing, redWidth, redHeight]];

    //-------------------- OrangeViews ------------------------------------------------------
    
/* The orange boxes are 30 points tall, with the left one being 70 points wide and the right one being 50 points wide. */
    
    
    
    UIView *orangeViewRight = [[UIView alloc] initWithFrame:CGRectZero];
    orangeViewRight.translatesAutoresizingMaskIntoConstraints = NO;
    orangeViewRight.backgroundColor = [UIColor orangeColor];
    [redView addSubview:orangeViewRight];
    
    NSLayoutConstraint *orangeRightHeight = [NSLayoutConstraint constraintWithItem:orangeViewRight
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:30];
    
    NSLayoutConstraint *orangeRightWidth = [NSLayoutConstraint constraintWithItem:orangeViewRight
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:50];
    
    NSLayoutConstraint *orangeRightTrailing = [NSLayoutConstraint constraintWithItem:orangeViewRight
                                                                           attribute:NSLayoutAttributeTrailing
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:redView
                                                                           attribute:NSLayoutAttributeTrailing
                                                                          multiplier:1.0
                                                                            constant:-8];
    
    NSLayoutConstraint *orangeRightTop = [NSLayoutConstraint constraintWithItem:orangeViewRight
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:redView
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1.0
                                                                            constant:8];
    
    
    [self.view addConstraints:@[orangeRightHeight, orangeRightWidth, orangeRightTrailing, orangeRightTop]];
    
    UIView *orangeViewLeft = [[UIView alloc] initWithFrame:CGRectZero];
    orangeViewLeft.translatesAutoresizingMaskIntoConstraints = NO;
    orangeViewLeft.backgroundColor = [UIColor orangeColor];
    [redView addSubview:orangeViewLeft];
    
    NSLayoutConstraint *orangeLeftHeight = [NSLayoutConstraint constraintWithItem:orangeViewLeft
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:30];
    
    NSLayoutConstraint *orangeLeftWidth = [NSLayoutConstraint constraintWithItem:orangeViewLeft
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:70];

    NSLayoutConstraint *orangeLeftTop = [NSLayoutConstraint constraintWithItem:orangeViewLeft
                                                                      attribute:NSLayoutAttributeTop
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:redView
                                                                      attribute:NSLayoutAttributeTop
                                                                     multiplier:1.0
                                                                       constant:8];
    
    NSLayoutConstraint *orangeLeftLeading = [NSLayoutConstraint constraintWithItem:orangeViewLeft
                                                                         attribute:NSLayoutAttributeLeading
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:redView
                                                                         attribute:NSLayoutAttributeLeading
                                                                        multiplier:1.0
                                                                          constant:8];

    [self.view addConstraints:@[orangeLeftHeight, orangeLeftWidth, orangeLeftTop, orangeLeftLeading]];
    

    //-------------------- BlueViews ------------------------------------------------------
    
    /* The blue boxes are 50 points tall by 50 points wide.
     Everything else is the default spacing between views, either as sibling or parent views. */
    
    UIView *topBlueView = [[UIView alloc] initWithFrame:CGRectZero];
    topBlueView.translatesAutoresizingMaskIntoConstraints = NO;
    topBlueView.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:topBlueView];
    
    NSLayoutConstraint *topBlueViewHeight = [NSLayoutConstraint constraintWithItem:topBlueView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:50];
    
    NSLayoutConstraint *topBlueViewWidth = [NSLayoutConstraint constraintWithItem:topBlueView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:50];
    
    NSLayoutConstraint *topBlueViewCenterX = [NSLayoutConstraint constraintWithItem:topBlueView
                                                                             attribute:NSLayoutAttributeCenterX
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.framingView
                                                                             attribute:NSLayoutAttributeCenterX
                                                                            multiplier:1.0
                                                                              constant:0];
    
    NSLayoutConstraint *topBlueViewCenterY = [NSLayoutConstraint constraintWithItem:topBlueView
                                                                             attribute:NSLayoutAttributeCenterY
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.framingView
                                                                             attribute:NSLayoutAttributeCenterY
                                                                            multiplier:0.5
                                                                              constant:0];

    
    [self.view addConstraints:@[topBlueViewHeight, topBlueViewWidth, topBlueViewCenterX, topBlueViewCenterY]];

    
    UIView *middleBlueView = [[UIView alloc] initWithFrame:CGRectZero];
    middleBlueView.translatesAutoresizingMaskIntoConstraints = NO;
    middleBlueView.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:middleBlueView];
    
    NSLayoutConstraint *middleBlueViewHeight = [NSLayoutConstraint constraintWithItem:middleBlueView
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1.0
                                                                             constant:50];
    
    NSLayoutConstraint *middleBlueViewWidth = [NSLayoutConstraint constraintWithItem:middleBlueView
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1.0
                                                                            constant:50];
    
    NSLayoutConstraint *middleBlueViewCenterX = [NSLayoutConstraint constraintWithItem:middleBlueView
                                                                             attribute:NSLayoutAttributeCenterX
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.framingView
                                                                             attribute:NSLayoutAttributeCenterX
                                                                            multiplier:1.0
                                                                              constant:0];
    
    NSLayoutConstraint *middleBlueViewCenterY = [NSLayoutConstraint constraintWithItem:middleBlueView
                                                                             attribute:NSLayoutAttributeCenterY
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.framingView
                                                                             attribute:NSLayoutAttributeCenterY
                                                                            multiplier:1.0
                                                                              constant:0];

    [self.view addConstraints:@[middleBlueViewHeight, middleBlueViewWidth, middleBlueViewCenterX, middleBlueViewCenterY]];
 
    
    UIView *bottomBlueView = [[UIView alloc] initWithFrame:CGRectZero];
    bottomBlueView.translatesAutoresizingMaskIntoConstraints = NO;
    bottomBlueView.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:bottomBlueView];
    
    NSLayoutConstraint *bottomBlueViewHeight = [NSLayoutConstraint constraintWithItem:bottomBlueView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:50];
    
    NSLayoutConstraint *bottomBlueViewWidth = [NSLayoutConstraint constraintWithItem:bottomBlueView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:50];
    
    NSLayoutConstraint *bottomBlueViewCenterX = [NSLayoutConstraint constraintWithItem:bottomBlueView
                                                                          attribute:NSLayoutAttributeCenterX
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.framingView
                                                                          attribute:NSLayoutAttributeCenterX
                                                                         multiplier:1.0
                                                                           constant:0];
    
    NSLayoutConstraint *bottomBlueViewCenterY = [NSLayoutConstraint constraintWithItem:bottomBlueView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.5
                                                                           constant:0];
    
    
    [self.view addConstraints:@[bottomBlueViewHeight, bottomBlueViewWidth, bottomBlueViewCenterX, bottomBlueViewCenterY]];
    
    
}

- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
