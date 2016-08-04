//
//  SZCustomActionSheetView.m
//  OneHour_Teacher
//
//  Created by kaola on 16/7/26.
//  Copyright © 2016年 kocla. All rights reserved.
//

#import "SZCustomActionSheetView.h"

@implementation SZCustomActionSheetView
{
    NSMutableArray *_titlesArr;
    
    NSString *_cancleTitle;
    
    UITableView *_tableView;
    
    UIButton *_btnCancle;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init{
    
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        
        _btnCancle = [[UIButton alloc] initWithFrame:self.frame];
        
        [self addSubview:_btnCancle];
        
        
        _btnCancle.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] ;
        
        [_btnCancle addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
        _tableView = [[UITableView alloc] init];
        
        [self addSubview:_tableView];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        _tableView.separatorColor = [UIColor lightGrayColor];
        
        
        _tableView.scrollEnabled = NO;
    }
    
    return self;
}

-(void)awakeFromNib{
    
    
//    UIAlertView *v = [[UIAlertView alloc] initWithTitle:<#(nullable NSString *)#> message:<#(nullable NSString *)#> delegate:<#(nullable id)#> cancelButtonTitle:<#(nullable NSString *)#> otherButtonTitles:<#(nullable NSString *), ...#>, nil]
}

-(void)actionCancleTitle:(NSString *)cancleTitle OtherTitles:(NSArray *)otherTitles{
    _titlesArr = [NSMutableArray array];
    
   
    [_titlesArr addObjectsFromArray:otherTitles];

    
    _cancleTitle = cancleTitle;
    
    [_tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _titlesArr.count + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    
    UILabel *labTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    
    labTitle.font = [UIFont systemFontOfSize:15];
    
    
    
    labTitle.textAlignment = NSTextAlignmentCenter;
    
    [cell addSubview:labTitle];
    
    
    if (indexPath.row == _titlesArr.count) {
        labTitle.text = _cancleTitle;
    }else{
        
        NSString *title = [_titlesArr objectAtIndex:indexPath.row];
        
        labTitle.text = title;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsZero];
        
    }
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        
        [cell setSeparatorInset:UIEdgeInsetsZero];
        
    }
    
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
        
    {
        
        [cell setPreservesSuperviewLayoutMargins:NO];
        
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == _titlesArr.count) {
        
        if ([self.delegate respondsToSelector:@selector(cancleTouchActionView:)]) {
            
            [self.delegate cancleTouchActionView:self];
            
        }
        [self dismiss];
        
    }else{

        if ([self.delegate respondsToSelector:@selector(actionView:didTouchItem:)]) {
            
            [self.delegate actionView:self didTouchItem:indexPath.row];
            
        }
        [self dismiss];
    }
}

-(void)show{
    
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    CGFloat height = 50 * (_titlesArr.count + 1);
    
    
    _tableView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, self.frame.size.width, height);
    
    [UIView animateWithDuration:0.3 animations:^{
        _tableView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - height, self.frame.size.width, height);
    }];
}

-(void)dismiss{
    
    
    
    if (self.superview) {
        [UIView animateWithDuration:0.3 animations:^{
            
            _tableView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, self.frame.size.width, _tableView.frame.size.height);
            
        } completion:^(BOOL finished) {
            
            [self removeFromSuperview];
        }];
    }
}
@end
