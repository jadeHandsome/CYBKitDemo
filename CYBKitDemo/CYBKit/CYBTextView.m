//
//  CYBTextView.m
//  ScollLabelDemo
//
//  Created by 曾洪磊 on 2019/5/14.
//  Copyright © 2019 曾洪磊. All rights reserved.
//

#import "CYBTextView.h"

@implementation CYBTextView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        UILabel *placeholderLabel = [[UILabel alloc]init];//添加一个占位label
        placeholderLabel.backgroundColor = [UIColor clearColor];
        placeholderLabel.numberOfLines = 0; //设置可以输入多行文字时可以自动换行
        [self addSubview:placeholderLabel];
        self.placeholderLabel = placeholderLabel; //赋值保存
        self.placeholderColor = [UIColor lightGrayColor]; //设置占位文字默认颜色
        self.font= [UIFont systemFontOfSize:14]; //设置默认的字体
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self]; //通知:监听文字的改变
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    UILabel *placeholderLabel = [[UILabel alloc]init];//添加一个占位label
    placeholderLabel.backgroundColor= [UIColor clearColor];
    placeholderLabel.numberOfLines = 0; //设置可以输入多行文字时可以自动换行
    [self addSubview:placeholderLabel];
    self.placeholderLabel = placeholderLabel; //赋值保存
    self.placeholderColor = [UIColor lightGrayColor]; //设置占位文字默认颜色
    self.font = [UIFont systemFontOfSize:14]; //设置默认的字体
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self]; //通知:监听文字的改变
}
- (void)textDidChange {
    self.placeholderLabel.hidden = self.hasText;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect rect = self.placeholderLabel.frame;
    rect.origin.y = self.textContainerInset.top;
    rect.origin.x = 5 + self.textContainerInset.left;
    rect.size.width = self.frame.size.width - rect.origin.x * 2.0;
    CGSize maxSize = CGSizeMake(self.frame.size.width - rect.origin.x * 2.0, MAXFLOAT);
    rect.size.height = [self.placeholder boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.placeholderLabel.font} context:nil].size.height;
    self.placeholderLabel.frame = rect;
}
- (void)setPlaceholder:(NSString *)placeholder{
    _placeholder = [placeholder copy];
    //设置文字
    self.placeholderLabel.text = placeholder;
    //重新计算子控件frame
    [self setNeedsDisplay];
    [self setNeedsLayout];
}
- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    //设置颜色
    self.placeholderLabel.textColor = placeholderColor;
}
//重写这个set方法保持font一致
- (void)setFont:(UIFont *)font {
    [super setFont:font];
    self.placeholderLabel.font= font;
    //重新计算子控件frame
    [self setNeedsLayout];
}
- (void)setText:(NSString *)text{
    [super setText:text];
    [self textDidChange]; //这里调用的就是 UITextViewTextDidChangeNotification 通知的回调
}
- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    [self textDidChange]; //这里调用的就是UITextViewTextDidChangeNotification 通知的回调
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:UITextViewTextDidChangeNotification];
}

@end
