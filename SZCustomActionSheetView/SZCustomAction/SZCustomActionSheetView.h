//
//  SZCustomActionSheetView.h
//  OneHour_Teacher
//
//  Created by kaola on 16/7/26.
//  Copyright © 2016年 kocla. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SZCustomActionSheetView;
@protocol SZCustomActionSheetViewDelegate <NSObject>

-(void)actionView:(SZCustomActionSheetView *)actionView didTouchItem:(NSInteger)item;
-(void)cancleTouchActionView:(SZCustomActionSheetView *)actionView;

@end
@interface SZCustomActionSheetView : UIView<UITableViewDataSource, UITableViewDelegate>




@property (nonatomic, weak) id<SZCustomActionSheetViewDelegate>delegate;

-(void)actionCancleTitle:(NSString *)cancleTitle OtherTitles:(NSArray *)otherTitles;

-(void)show;
@end
