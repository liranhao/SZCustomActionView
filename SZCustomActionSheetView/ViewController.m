//
//  ViewController.m
//  SZCustomActionSheetView
//
//  Created by kaola on 16/8/4.
//  Copyright © 2016年 liranhao. All rights reserved.
//

#import "ViewController.h"
#import "SZCustomActionSheetView.h"
@interface ViewController ()<SZCustomActionSheetViewDelegate>

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

- (IBAction)btnShow:(id)sender {
    
    SZCustomActionSheetView *actionView = [[SZCustomActionSheetView alloc] init];
    
    actionView.delegate = self;
    
    actionView.tag = 1;
    
    NSString *title = @"确认";
    
    [actionView actionCancleTitle:@"取消" OtherTitles:@[title]];
    
    [actionView show];
}
-(void)actionView:(SZCustomActionSheetView *)actionView didTouchItem:(NSInteger)item{
    NSLog(@"确认");
}

-(void)cancleTouchActionView:(SZCustomActionSheetView *)actionView{
    
    NSLog(@"取消");
}
@end
