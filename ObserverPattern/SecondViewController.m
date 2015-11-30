//
//  SecondViewController.m
//  ObserverPattern
//
//  Created by Aditya Narayan on 11/30/15.
//  Copyright © 2015 turntotech.io. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textBox;
@property (strong, nonatomic) NSString* stringProperty;
@end

@implementation SecondViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)updateProperty:(UIButton *)sender {
  self.stringProperty = self.textBox.text;
  [[NSNotificationCenter defaultCenter] postNotificationName:@"TTTStringPropertyNotification" object:self userInfo:@{@"stringProperty":self.stringProperty}];
}

@end
