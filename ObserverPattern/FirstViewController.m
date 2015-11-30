//
//  FirstViewController.m
//  ObserverPattern
//
//  Created by Aditya Narayan on 11/30/15.
//  Copyright © 2015 turntotech.io. All rights reserved.
//

#import "FirstViewController.h"
#import "ObservableClass.h"

@interface FirstViewController ()
@property (strong, nonatomic) IBOutlet UILabel *NSNotificationString;
@property (strong, nonatomic) IBOutlet UILabel *KVOString;
@property (strong, nonatomic) IBOutlet UILabel *delegateString;
@property (strong, nonatomic) ObservableClass *ob;

@end

@implementation FirstViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  //nsnotification
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateNSNotificationTextBox:) name:@"TTTStringPropertyNotification" object:nil];
  
  //kvo
  _ob = [ObservableClass sharedManager];
  [self.ob addObserver:self forKeyPath:@"text" options:0 context:nil];

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)updateNSNotificationTextBox:(NSNotification*)notification{
  self.NSNotificationString.text = [NSString stringWithFormat:@"Property of NSNotification ViewController: %@",notification.userInfo[@"stringProperty"]];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
  if ([keyPath isEqualToString:@"text"])
  {
    _KVOString.text = [NSString stringWithFormat:@"Property of KVO ViewController: %@",[object valueForKey:@"text"]];
  }
}

@end
