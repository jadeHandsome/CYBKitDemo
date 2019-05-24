//
//  CYBLunBoView.m
//  CYBKitDemo
//
//  Created by 曾洪磊 on 2019/5/24.
//  Copyright © 2019 曾洪磊. All rights reserved.
//

#import "CYBLunBoView.h"
@interface CYBLunBoView()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, assign) NSInteger countInt;
@end
@implementation CYBLunBoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        self.countInt = 0;
        [self setUp];
    }
    return self;
}
- (void)setTexts:(NSArray *)texts {
    _texts = texts;
    if (texts.count > 0) {
        [self beginTimer];
    }
}
- (void)beginTimer {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [self addGestureRecognizer:tap];
    [self setFirstText];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(displayNews) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)tapClick:(UITapGestureRecognizer *)tap {
    if (self.tapBlock) {
        self.tapBlock(self.currentIndex);
    }
}
- (void)setFirstText {
    if (self.customView) {
        if (self.customBlock) {
            self.customBlock(self.centerView,0);
        }
        if (self.customBlock) {
            self.customBlock(self.centerView,1);
        }
        if (self.customBlock) {
            self.customBlock(self.centerView,2);
        }
    } else {
        if (self.texts.count == 1) {
            UILabel *topLabel = [self.topView viewWithTag:10];
            UILabel *centerLabel = [self.centerView viewWithTag:10];
            UILabel *bottomLabel = [self.bottomView viewWithTag:10];
            topLabel.text = self.texts[0];
            centerLabel.text = self.texts[0];
            bottomLabel.text = self.texts[0];
//            self.countInt = 0;
        } else if (self.texts.count == 2) {
            UILabel *topLabel = [self.topView viewWithTag:10];
            UILabel *centerLabel = [self.centerView viewWithTag:10];
            UILabel *bottomLabel = [self.bottomView viewWithTag:10];
            topLabel.text = self.texts[0];
            centerLabel.text = self.texts[0];
            bottomLabel.text = self.texts[1];
//            self.countInt = 0;
        } else {
            UILabel *topLabel = [self.topView viewWithTag:10];
            UILabel *centerLabel = [self.centerView viewWithTag:10];
            UILabel *bottomLabel = [self.bottomView viewWithTag:10];
            topLabel.text = self.texts[2];
            centerLabel.text = self.texts[0];
            bottomLabel.text = self.texts[1];
//            self.countInt = 2 ;
        }
    }
    
}
- (void)setCustomView:(UIView *)customView {
    _customView = customView;
    if (customView) {
        for (UIView *sub in self.subviews) {
            [sub removeFromSuperview];
        }
        self.topView = customView;
        self.centerView = customView;
        self.bottomView = customView;
    }
    
}
- (UIView *)topView {
    if (!_topView) {
        _topView = [UIView new];
        UILabel *contentLabel = [[UILabel alloc]init];
        contentLabel.numberOfLines = 1;
        [contentLabel setTextColor:[UIColor colorWithRed:51.0/255 green:51.0/255 blue:51.0/255 alpha:1]];
        [contentLabel setTextAlignment:NSTextAlignmentLeft];
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.tag = 10;
        [_topView addSubview:contentLabel];
    }
    return _topView;
}
- (UIView *)centerView {
    if (!_centerView) {
        _centerView = [UIView new];
        UILabel *contentLabel = [[UILabel alloc]init];
        contentLabel.numberOfLines = 1;
        [contentLabel setTextColor:[UIColor colorWithRed:51.0/255 green:51.0/255 blue:51.0/255 alpha:1]];
        [contentLabel setTextAlignment:NSTextAlignmentLeft];
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.tag = 10;
        [_centerView addSubview:contentLabel];
    }
    return _centerView;
}
- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        UILabel *contentLabel = [[UILabel alloc]init];
        contentLabel.numberOfLines = 1;
        [contentLabel setTextColor:[UIColor colorWithRed:51.0/255 green:51.0/255 blue:51.0/255 alpha:1]];
        [contentLabel setTextAlignment:NSTextAlignmentLeft];
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.tag = 10;
        [_bottomView addSubview:contentLabel];
    }
    return _bottomView;
}
- (void)setUp {
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    [self addSubview:self.topView];
    [self addSubview:self.centerView];
    [self addSubview:self.bottomView];
    self.topView.frame = CGRectMake(0, - height, width, height);
    self.centerView.frame = CGRectMake(0, 0, width, height);
    self.bottomView.frame = CGRectMake(0, height, width, height);
    if (!self.customView) {
        UILabel *topLabel = [self.topView viewWithTag:10];
        UILabel *centerLabel = [self.centerView viewWithTag:10];
        UILabel *bottomLabel = [self.bottomView viewWithTag:10];
        topLabel.frame = CGRectMake(0, 0, width, height);
        centerLabel.frame = CGRectMake(0, 0, width, height);
        bottomLabel.frame = CGRectMake(0, 0, width, height);
    }
}
- (void)displayNews {
    self.countInt ++;
    
    if (self.texts.count > self.countInt) {
        if (self.customView) {
            if (self.customBlock) {
                self.customBlock(self.bottomView, self.countInt);
            }
        } else {
            UILabel *bottomLabel = [self.bottomView viewWithTag:10];
            bottomLabel.text = self.texts[self.countInt];
        }
    }
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:1 animations:^{
        CGFloat height = self.frame.size.height;
        CGFloat width = self.frame.size.width;
        weakSelf.centerView.frame = CGRectMake(0, -height, width, height);
        weakSelf.bottomView.frame = CGRectMake(0, 0, width, height);
    } completion:^(BOOL finished) {
        weakSelf.currentIndex = weakSelf.countInt;
        CGFloat height = self.frame.size.height;
        CGFloat width = self.frame.size.width;
        weakSelf.topView.frame = CGRectMake(0, height, width, height);
        UIView *temp1 = weakSelf.topView;
        weakSelf.topView = weakSelf.centerView;
        weakSelf.centerView = weakSelf.bottomView;
        weakSelf.bottomView = temp1;
        NSInteger tempCount = self.countInt + 1;
        if (tempCount > self.texts.count) {
            tempCount = 0;
        }
        if (weakSelf.texts.count > tempCount ) {
            if (weakSelf.customView) {
                if (weakSelf.customBlock) {
                    weakSelf.customBlock(weakSelf.topView, tempCount);
                }
            } else {
                UILabel *bottomlabel = [weakSelf.bottomView viewWithTag:10];
                bottomlabel.text = weakSelf.texts[tempCount];
            }
        }
    }];
}
- (void)destory {
    @try {
        if (self.timer) {
            [self.timer invalidate];
            for (UIView *sub in self.subviews) {
                [sub removeFromSuperview];
            }
        }
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
}
@end
