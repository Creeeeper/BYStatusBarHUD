//
//  ViewController.m
//  BYStatusBarHUD
//
//  Created by liby on 17/2/28.
//  Copyright © 2017年 liby. All rights reserved.
//

#import "ViewController.h"
#import "BYStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [BYStatusBarHUD setBGColor:[UIColor whiteColor]];
    [BYStatusBarHUD setMsgColor:[UIColor blackColor]];
    [BYStatusBarHUD setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyleGray)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)a:(id)sender {
    [BYStatusBarHUD showMessage:@"没啥事"];
}
- (IBAction)b:(id)sender {
    [BYStatusBarHUD showSuccess:@"加载成功"];
}
- (IBAction)c:(id)sender {
    [BYStatusBarHUD showError:@"加载失败"];
}
- (IBAction)d:(id)sender {
    [BYStatusBarHUD showLoading:@"正在加载"];
}
- (IBAction)e:(id)sender {
    [BYStatusBarHUD hide];
}


@end
