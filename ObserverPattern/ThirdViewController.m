//
//  ThirdViewController.m
//  ObserverPattern
//
//  Created by Aditya Narayan on 11/30/15.
//  Copyright © 2015 turntotech.io. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textBox;
@property (strong, nonatomic) IBOutlet UILabel *outputText;
@property (strong, nonatomic) NSString *stringToObserve;
@property (strong, nonatomic) NSMutableDictionary *dict;
@property (nonatomic, strong) ObservableClass *ob;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  _ob = [ObservableClass sharedManager];//[[ObservableClass alloc] init];
  [_ob setValue:@"test" forKey:@"text"];
  [self.ob addObserver:self forKeyPath:@"text" options:0 context:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)updateProperty:(UIButton *)sender {
  [_ob setValue:_textBox.text forKey:@"text"];
  
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
  if ([keyPath isEqualToString:@"text"])
  {
    _outputText.text = [object valueForKey:@"text"];
  }
}
@end
