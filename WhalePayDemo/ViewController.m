//
//  ViewController.m
//  WhalePayDemo
//
//  Created by 李勇 on 2017/3/2.
//  Copyright © 2017年 liyong. All rights reserved.
//

#import "ViewController.h"
#import "WhalePayViewController.h"
#import "MBProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)payAction {
    
    WPOrder *wpOrder = [[WPOrder alloc] init];
    
    //    akOrder.appkey = @"5ew28qukblY8r6n9P3BG";
    //    akOrder.appsecret = @"NmU7hSSADNN9rKB0AwLbi9K9GyIW2K2f";
    
    wpOrder.pno = @"123456789";
    wpOrder.cno = @"987654321";
    //    akOrder.cno = @"0";
    wpOrder.money = @"0.10";
    wpOrder.orderno = @"123123123";
    wpOrder.content = @"机械键盘";
    wpOrder.userId = @"233";
    wpOrder.destArray = @[@{
                              @"atid" : @"2",
                              @"pano" : @"qg_platform_1111"
                              },
                          @{
                              @"atid" : @"4",
                              @"pano" : @"1004b4aac2537a3b40cdaf3bac370ad0"
                              },
                          @{
                              @"atid" : @"31",
                              @"pano" : @"1031c5a4efa552b24491bda9d212abbb"
                              },
                          @{
                              @"atid" : @"22",
                              @"pano" : @"1022b894ecacd84948f39a6c659ac7eb"
                              },
                          @{
                              @"atid" : @"24",
                              @"pano" : @"10248312ea4508534c3dbee977ddd917"
                              }];
    //    akOrder.destArray = @[@{
    //                              @"atid" : @"31",
    //                              @"pano" : @"1031c5a4efa552b24491bda9d212abbb"
    //                              }];
    WhalePayViewController *whalePayVC = [WhalePayViewController sharedInstance];
    whalePayVC.bundleName = @"";
    
    
    [whalePayVC createPayment:wpOrder viewController:self withCompletion:^(NSDictionary *result) {
        if ([[result objectForKey:@"code"] integerValue] == 0){
            [MBProgressHUD showError:[result objectForKey:@"message"] toView:self.view];
        }else{
            [MBProgressHUD showError:[result objectForKey:@"message"] toView:self.view];
            NSLog(@"%@",[result objectForKey:@"message"]);
        }
    }];

}

@end
