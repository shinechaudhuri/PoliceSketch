//
//  LPSViewController.m
//  PoliceSketch
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPSViewController.h"

@interface LPSViewController ()

@property (nonatomic, strong) NSArray *eyeArray;
@property (nonatomic, strong) NSArray *noseArray;
@property (nonatomic, strong) NSArray *mouthArray;

@property (nonatomic, assign) int eyesCounter;
@property (nonatomic, assign) int noseCounter;
@property (nonatomic, assign) int mouthCounter;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end

@implementation LPSViewController



//// Previous code
//- (NSArray *)partImagesFromBase:(NSString *)imageBaseName
//{
//    NSMutableArray *eyeArray = [[NSMutableArray alloc] initWithCapacity:5];
//    for (int i = 1; i < 5; i++){
//        [eyeArray addObject: [UIImage imageNamed: [NSString stringWithFormat: @"%@_%d.jpg", imageBaseName, i]]];
//    }
//    return eyeArray;
//}

- (NSString *)imageNameForBase:(NSString *)base num:(int)num {
    
    NSString *imageName = [NSString stringWithFormat:@"%@_%i.jpg", base, num];
    
    return imageName;
}

- (void) setupView {
    self.eyesCounter = 1;
    self.noseCounter = 1;
    self.mouthCounter = 1;
}

-(void) refreshView {
    self.current_Eye.image = [UIImage imageNamed:[self imageNameForBase:@"eyes" num:self.eyesCounter]];
    
    self.current_Nose.image = [UIImage imageNamed:[self imageNameForBase:@"nose" num:self.noseCounter]];
    
//    // self.current_Eye.image.layer;
//    self.current_Eye.transform = CGAffineTransformMakeScale(2, 2);
    
    self.current_Mouth.image = [UIImage imageNamed:[self imageNameForBase:@"mouth" num:self.mouthCounter]];

//-----Label-----
    
    if (self.eyesCounter == self.noseCounter && self.noseCounter == self.mouthCounter){
        self.nameLabel.text = @"'Tis the SAME!";
    } else {
        self.nameLabel.text = @"";
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupView];
    
    [self refreshView];

}

//-----Right buttons-----

- (IBAction)eyesNextButtonPressed:(id)sender {
    self.eyesCounter++;
    if (self.eyesCounter > 5) {
        self.eyesCounter = 1;
    }
    
    [self refreshView];
}

- (IBAction)noseNextButtonPressed:(id)sender {
    self.noseCounter++;
    if (self.noseCounter > 5){
        self.noseCounter = 1;
    }
    
    [self refreshView];
    
}

- (IBAction)mouthNextButtonPressed:(id)sender {
    self.mouthCounter++;
    if (self.mouthCounter > 5){
        self.mouthCounter = 1;
    }
    
    [self refreshView];
    
}

//-----Left Buttons-----


- (IBAction)eyesPreviousButtonPressed:(id)sender {
    self.eyesCounter--;
    if (self.eyesCounter < 1){
        self.eyesCounter = 5;
    }
    
    [self refreshView];
}

- (IBAction)nosePreviousButtonPressed:(id)sender {
    self.noseCounter--;
    if (self.noseCounter < 1){
        self.noseCounter = 5;
    }
    
    [self refreshView];
}

- (IBAction)mouthPreviousButtonPressed:(id)sender {
    self.mouthCounter--;
    if (self.mouthCounter < 1){
        self.mouthCounter = 5;
    }
    
    [self refreshView];
}




@end
