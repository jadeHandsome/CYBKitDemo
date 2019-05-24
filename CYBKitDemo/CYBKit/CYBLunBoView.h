//
//  CYBLunBoView.h
//  CYBKitDemo
//
//  Created by 曾洪磊 on 2019/5/24.
//  Copyright © 2019 曾洪磊. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^LUNBO_TAP)(NSInteger index);
typedef void(^CUSTOM_SET_VIEW)(id _Nullable customView,NSInteger index);
NS_ASSUME_NONNULL_BEGIN

@interface CYBLunBoView : UIView
//自定义的每一个滑动的View
@property (nonatomic, strong) UIView *customView;
//需要上下翻转的字符串数组
@property (nonatomic, strong) NSArray *texts;
//当前滑动到的下标
@property (nonatomic, assign) NSInteger currentIndex;
//点击事件
@property (nonatomic, copy) LUNBO_TAP tapBlock;
//自定义渲染(customView:自定义的view，如果不传自定义view则不会调用)
@property (nonatomic, copy) CUSTOM_SET_VIEW customBlock;
- (void)destory;
@end

NS_ASSUME_NONNULL_END
