//
//  LuisXKit.m
//  LuisXKit
//
//  Created by LuisX on 2016/10/19.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "LuisXKit.h"

@implementation LuisXKit
/**
 系统push
 
 @param navigationController
 @param viewController
 @param hidesBottomBar       是否隐藏Tabbar
 @param animated             是否动画
 */
+ (void)navigationController:(UINavigationController *)navigationController pushViewController:(UIViewController *)viewController HidesBottomBar:(BOOL)hidesBottomBar Animated:(BOOL)animated{
    
    viewController.hidesBottomBarWhenPushed = hidesBottomBar;
    [navigationController pushViewController:viewController animated:animated];
    
}

#pragma mark -基础控件
/**
 UILabel

 @param addView   添加View
 @param textColor 文本颜色
 @param font      字体
 */
+ (UILabel *)labelAddView:(UIView *)addView TextColor:(UIColor *)textColor Font:(UIFont *)font{
    
    UILabel *label = [UILabel new];
    //label.backgroundColor = [UIColor orangeColor];
    label.textColor = textColor;
    label.font = font;
    [addView addSubview:label];
    return label;
    
}
/**
 UIButton

 @param addView         添加View
 @param title           标题
 @param titleColor      标题颜色
 @param font            字体
 @param cornerRadius    圆角
 @param backgroundColor 背景颜色
 */
+ (UIButton *)buttonAddView:(UIView *)addView Title:(NSString *)title TitleColor:(UIColor *)titleColor Font:(UIFont *)font CornerRadius:(CGFloat)cornerRadius BackgroundColor:(UIColor *)backgroundColor{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = backgroundColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    button.layer.cornerRadius = cornerRadius;
    [addView addSubview:button];
    return button;
    
}
/**
 UIImageView

 @param addView       添加View
 @param clipsToBounds 边界裁剪
 @param contentMode   显示方式
 */
+ (UIImageView *)imageViewAddView:(UIView *)addView ClipsToBounds:(BOOL)clipsToBounds ContentMode:(UIViewContentMode)contentMode{
    
    UIImageView *imageView = [UIImageView new];
    //imageView.backgroundColor = [UIColor orangeColor];
    imageView.clipsToBounds = clipsToBounds;
    imageView.contentMode = contentMode;
    [addView addSubview:imageView];
    return imageView;
    
}

/**
 UITextField
 
 @param placeholder   占位符
 @param textColor     文本颜色
 @param font          字体
 */
+ (UITextField *)textfieldAddView:(UIView *)addView Placeholder:(NSString *)placeholder TextColor:(UIColor *)textColor Font:(UIFont *)font{
    
    UITextField *textfield = [UITextField new];
    textfield.backgroundColor = [UIColor orangeColor];
    textfield.placeholder = placeholder;
    textfield.textColor = textColor;
    textfield.font = font;
    textfield.autocapitalizationType = UITextAutocapitalizationTypeNone;        //关闭首字母大写
    textfield.autocorrectionType = UITextAutocorrectionTypeNo;                  //关闭自动更正
//    textField.keyboardType = UIKeyboardTypePhonePad;
//    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [addView addSubview:textfield];
    return textfield;
    
}
#pragma mark -HUD
//----------------------------------------------------------------------------------------------------------------------------------
/**
 通用MBProgressHUD

 @param view             添加view
 @param mode             显示样式
 @param animationType    动画类型
 @param cornerRadius     圆角
 @param minSize          最小尺寸
 @param labelText        文本(1行)
 @param labelFont        文本字体
 @param detailsLabelText 详情(n行)
 @param detailsLabelFont 详情字体
 @param style            面板样式
 @param margin           边距
 @param offset           偏移量(居添加View的Center/不会超出屏幕)
 @param bezelViewColor   面板颜色
 @param backgroundColor  背景颜色
 */
+ (MBProgressHUD *)addCommonHUDAddedTo:(UIView *)view Mode:(MBProgressHUDMode)mode AnimationType:(MBProgressHUDAnimation)animationType CornerRadius:(CGFloat)cornerRadius MinSize:(CGSize)minSize LabelText:(NSString *)labelText LabelFont:(UIFont *)labelFont DetailsLabelText:(NSString *)detailsLabelText DetailsLabelFont:(UIFont *)detailsLabelFont Style:(MBProgressHUDBackgroundStyle)style Margin:(CGFloat)margin Offset:(CGPoint)offset BezelViewColor:(UIColor *)bezelViewColor BackgroundColor:(UIColor *)backgroundColor{
    
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.mode = mode;                                                        //显示样式           默认:MBProgressHUDModeIndeterminate
    HUD.animationType = animationType;                                      //动画类型           默认:MBProgressHUDAnimationFade
    HUD.bezelView.layer.cornerRadius = cornerRadius;                        //圆角              默认:5
    HUD.minSize = minSize;                                                  //最小尺寸           默认:CGSizeZero
    HUD.label.text = labelText;                                             //说明(单行)         默认:nil
    HUD.label.font = labelFont;                                             //说明字体(单行)      默认:17
    HUD.detailsLabel.text = detailsLabelText;                               //详细说明(多行)      默认:nil
    HUD.detailsLabel.font = detailsLabelFont;                               //详细说明字体(多行)   默认:17
    HUD.bezelView.style = style;                                            //面板样式            默认:MBProgressHUDBackgroundStyleSolidColor
    HUD.margin = margin;                                                    //边距               默认:20
    HUD.offset = offset;                                                    //center偏移量       默认:0,0
    HUD.contentColor = [UIColor whiteColor];                                //内容颜色
    HUD.bezelView.color = bezelViewColor;                                   //面板颜色
    HUD.backgroundColor = backgroundColor;                                  //背景颜色            默认:nil
    return HUD;
}
/**
 隐藏MBProgressHUD

 @param view 从该view上
 */
+ (void)hiddenMBProgressHUDForView:(UIView *)view{
    [MBProgressHUD hideHUDForView:view animated:YES];
}
//----------------------------------------------------------------------------------------------------------------------------------

/**
 窗口(菊花文本)

 @param text 文本
 */
+ (void)showWindowsProgressHUDText:(NSString *)text{
    
    [self addCommonHUDAddedTo:luisx_APP_keyWindow Mode:MBProgressHUDModeIndeterminate AnimationType:MBProgressHUDAnimationFade CornerRadius:3 MinSize:CGSizeMake(120, 80) LabelText:text LabelFont:luisx_FONT_system_size(14) DetailsLabelText:nil DetailsLabelFont:nil Style:MBProgressHUDBackgroundStyleBlur Margin:10 Offset:CGPointZero BezelViewColor:luisx_COLOR_black_alpha(0.80) BackgroundColor:nil];
    
}
/**
 窗口(纯文本)

 @param text 文本
 */
+ (void)showWindowsOnlyTextHUDText:(NSString *)text{
    
    MBProgressHUD *HUD = [self addCommonHUDAddedTo:luisx_APP_keyWindow Mode:MBProgressHUDModeText AnimationType:MBProgressHUDAnimationFade CornerRadius:3 MinSize:CGSizeZero LabelText:nil LabelFont:nil DetailsLabelText:text DetailsLabelFont:luisx_FONT_system_size(14) Style:MBProgressHUDBackgroundStyleSolidColor Margin:10 Offset:CGPointZero BezelViewColor:luisx_COLOR_black_alpha(0.80) BackgroundColor:nil];
    [HUD hideAnimated:YES afterDelay:1.5];
    [HUD removeFromSuperViewOnHide];
    
}

/**
 自定义(HUD)

 @param view            添加view
 @param customView      自定义view
 @param animationType   动画类型
 @param cornerRadius    圆角
 @param margin          面板边距
 @param offset          偏移center
 @param bezelViewColor  面板颜色
 @param backgroundColor 背景颜色
 */
+ (void)showCustomHUDAddedTo:(UIView *)view CustomView:(UIView *)customView AnimationType:(MBProgressHUDAnimation)animationType CornerRadius:(CGFloat)cornerRadius Margin:(CGFloat)margin Offset:(CGPoint)offset bezelViewColor:(UIColor *)bezelViewColor BackgroundColor:(UIColor *)backgroundColor{
    
    MBProgressHUD *HUD = [self addCommonHUDAddedTo:view Mode:MBProgressHUDModeCustomView AnimationType:animationType CornerRadius:cornerRadius MinSize:CGSizeZero LabelText:nil LabelFont:nil DetailsLabelText:nil DetailsLabelFont:nil Style:MBProgressHUDBackgroundStyleSolidColor Margin:margin Offset:offset BezelViewColor:bezelViewColor BackgroundColor:backgroundColor];
    HUD.customView = customView;

}

#pragma 文件处理
/**
 获取bundle中某些图片数组
 
 @param bundleName bundle名
 @param imageName  image名
 @param count      image数目(从0开始获取,返回有效图片)
 */
+ (NSArray *)getBundleImageArrayWithBundleName:(NSString *)bundleName imageName:(NSString *)imageName Count:(NSInteger)count{
    
    NSMutableArray *imageFilePathArr = [NSMutableArray array];
    NSString* bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    for (NSInteger i = 0; i < count; i++) {
        NSString *filePath = [bundlePath stringByAppendingString:[NSString stringWithFormat:@"/%@%ld", imageName, i]];
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        if (image) {
            [imageFilePathArr addObject:image];
        }
    }
    return imageFilePathArr;
    
}

#pragma mark -复杂界面流畅性

/**
 Node富文本
 
 @param text 文本
 @param textColor 文本颜色
 @param font 字体
 */
+ (NSAttributedString *)nodeAttributesStringText:(NSString *)text TextColor:(UIColor *)textColor Font:(UIFont *)font{
    
    //快速创建富文本
    NSDictionary *attributesDic = @{NSFontAttributeName: font, NSForegroundColorAttributeName : textColor};
    NSAttributedString *attributesString = [[NSAttributedString alloc] initWithString:text attributes:attributesDic];
    return attributesString;
    
}


/**
 NodeLabel
 
 @param addView 添加View
 */
+ (ASTextNode *)nodeTextNodeAddNode:(ASDisplayNode *)addNode{
    
    //只支持富文本显示
    ASTextNode *textNode = [ASTextNode new];
    //textNode.backgroundColor = [UIColor orangeColor];
    [addNode addSubnode:textNode];
    return textNode;
    
}


/**
 NodeView

 @param addView 添加View
 @param backgroundColor 背景颜色
 */
+ (ASDisplayNode *)nodeDisplayNodeAddNode:(ASDisplayNode *)addNode BackgroundColor:(UIColor *)backgroundColor{
    
    ASDisplayNode *displayNode = [ASDisplayNode new];
    displayNode.backgroundColor = backgroundColor;
    [addNode addSubnode:displayNode];
    return displayNode;
    
}

/**
 NodeButton(文本)

 @param addView 添加View
 @param title 标题
 @param titleColor 标题颜色
 @param font 字体
 @param cornerRadius 圆角
 @param backgroundColor 背景颜色
 @param contentVerticalAlignment 内容竖直对齐方式
 @param contentHorizontalAlignment 内容水平对齐方式
 */
+ (ASButtonNode *)nodeButtonNodeAddNode:(ASDisplayNode *)addNode Title:(NSString *)title TitleColor:(UIColor *)titleColor Font:(UIFont *)font CornerRadius:(CGFloat)cornerRadius BackgroundColor:(UIColor *)backgroundColor ContentVerticalAlignment:(ASVerticalAlignment)contentVerticalAlignment ContentHorizontalAlignment:(ASHorizontalAlignment)contentHorizontalAlignment{
    
    ASButtonNode *buttonNode = [ASButtonNode new];
    buttonNode.backgroundColor = backgroundColor;
    if (title) {
        [buttonNode setTitle:title withFont:font withColor:titleColor forState:ASControlStateNormal];
    }
    buttonNode.contentVerticalAlignment = contentVerticalAlignment;
    buttonNode.contentHorizontalAlignment = contentHorizontalAlignment;
    buttonNode.cornerRadius = cornerRadius;
    [addNode addSubnode:buttonNode];
    return buttonNode;
    
}

/**
 NodeButton(图文)

 @param addView 添加View
 @param title 标题
 @param titleColor 标题颜色
 @param font 字体
 @param image 图片
 @param imageAlignment 图片对齐方式(前/后)
 @param cornerRadius 圆角
 @param backgroundColor 背景颜色
 @param contentVerticalAlignment 内容竖直对齐方式
 @param contentHorizontalAlignment 内容水平对齐方式
 */
+ (ASButtonNode *)nodeButtonNodeAddNode:(ASDisplayNode *)addNode Title:(NSString *)title TitleColor:(UIColor *)titleColor Font:(UIFont *)font Image:(UIImage *)image ImageAlignment:(ASButtonNodeImageAlignment)imageAlignment CornerRadius:(CGFloat)cornerRadius BackgroundColor:(UIColor *)backgroundColor ContentVerticalAlignment:(ASVerticalAlignment)contentVerticalAlignment ContentHorizontalAlignment:(ASHorizontalAlignment)contentHorizontalAlignment{
    
    ASButtonNode *buttonNode = [ASButtonNode new];
    buttonNode.backgroundColor = backgroundColor;
    if (title) {
        [buttonNode setTitle:title withFont:font withColor:titleColor forState:ASControlStateNormal];
    }
    if (image) {
        [buttonNode setImage:image forState:ASControlStateNormal];
    }
    [buttonNode setImageAlignment:imageAlignment];
    buttonNode.contentVerticalAlignment = contentVerticalAlignment;
    buttonNode.contentHorizontalAlignment = contentHorizontalAlignment;
    buttonNode.cornerRadius = cornerRadius;
    [addNode addSubnode:buttonNode];
    return buttonNode;
    
}

/**
 NodeImageView(普通)

 @param addView 添加View
 @param clipsToBounds 边界裁剪
 @param contentMode 显示方式(尽量使用枚举名称)
 */
+ (ASImageNode *)nodeImageNodeAddNode:(ASDisplayNode *)addNode ClipsToBounds:(BOOL)clipsToBounds ContentMode:(UIViewContentMode)contentMode{
    
    ASImageNode *imageNode = [ASImageNode new];
    //imageNode.backgroundColor = [UIColor grayColor];
    imageNode.clipsToBounds = clipsToBounds;
    imageNode.contentMode = contentMode;
    [addNode addSubnode:imageNode];
    return imageNode;
    
}

/**
 NodeImageView(网络)

 @param addView 添加View
 @param clipsToBounds 边界裁剪
 @param contentMode 显示方式(尽量使用枚举名称)
 @param defaultImage 占位图
 */
+ (ASNetworkImageNode *)nodeNetworkImageNodeAddNode:(ASDisplayNode *)addNode ClipsToBounds:(BOOL)clipsToBounds ContentMode:(UIViewContentMode)contentMode DefaultImage:(UIImage *)defaultImage{
    
    //网络图片
    ASNetworkImageNode *networkImageNode = [ASNetworkImageNode new];
    //networkImageNode.backgroundColor = [UIColor grayColor];
    if (defaultImage) {
        networkImageNode.defaultImage = defaultImage;
    }
    networkImageNode.clipsToBounds = clipsToBounds;
    networkImageNode.contentMode = contentMode;
    [addNode addSubnode:networkImageNode];
    return networkImageNode;
    
}


@end
