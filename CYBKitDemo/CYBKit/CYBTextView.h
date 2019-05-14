//
//  CYBTextView.h
//  ScollLabelDemo
//
//  Created by 曾洪磊 on 2019/5/14.
//  Copyright © 2019 曾洪磊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CYBTextView : UITextView
@property (nonatomic, copy)   NSString * placeholder;         //占位字符
@property (nonatomic, weak)   UILabel  * placeholderLabel;   //占位label 后期可以自定义
@property (nonatomic, strong) UIColor  * placeholderColor; //文字颜色
@end

NS_ASSUME_NONNULL_END
