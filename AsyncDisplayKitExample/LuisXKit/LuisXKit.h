//
//  LuisXKit.h
//  LuisXKit
//
//  Created by LuisX on 2016/10/19.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
@interface LuisXKit : NSObject
//颜色
#define luisx_COLOR_random           [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define luisx_COLOR_RGB(r, g, b)      [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define luisx_COLOR_RGBA(r, g, b, a)  [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define luisx_COLOR_white_alpha(a)    [UIColor colorWithWhite:1.00 alpha:(a)]
#define luisx_COLOR_black_alpha(a)    [UIColor colorWithWhite:0.00 alpha:(a)]

//字体
#define luisx_FONT_system_size(a)     [UIFont systemFontOfSize:(a)]
//视图
#define luisx_APP_keyWindow           [UIApplication sharedApplication].keyWindow
#define luisx_APP_screen_width        [UIScreen mainScreen].bounds.size.width
#define luisx_APP_screen_height       [UIScreen mainScreen].bounds.size.height
//转场
+ (void)navigationController:(UINavigationController *)navigationController
          pushViewController:(UIViewController *)viewController
              HidesBottomBar:(BOOL)hidesBottomBar
                    Animated:(BOOL)animated;

//常用控件
+ (UILabel *)labelAddView:(UIView *)addView
                TextColor:(UIColor *)textColor
                     Font:(UIFont *)font;

+ (UIButton *)buttonAddView:(UIView *)addView
                      Title:(NSString *)title
                 TitleColor:(UIColor *)titleColor Font:(UIFont *)font
               CornerRadius:(CGFloat)cornerRadius
            BackgroundColor:(UIColor *)backgroundColor;

+ (UIImageView *)imageViewAddView:(UIView *)addView
                    ClipsToBounds:(BOOL)clipsToBounds
                      ContentMode:(UIViewContentMode)contentMode;

+ (UITextField *)textfieldAddView:(UIView *)addView
                      Placeholder:(NSString *)placeholder
                        TextColor:(UIColor *)textColor
                             Font:(UIFont *)font;

//HUD
+ (void)hiddenMBProgressHUDForView:(UIView *)view;
+ (void)showWindowsProgressHUDText:(NSString *)text;
+ (void)showWindowsOnlyTextHUDText:(NSString *)text;
+ (void)showCustomHUDAddedTo:(UIView *)view
                  CustomView:(UIView *)customView
               AnimationType:(MBProgressHUDAnimation)animationType
                CornerRadius:(CGFloat)cornerRadius Margin:(CGFloat)margin
                      Offset:(CGPoint)offset bezelViewColor:(UIColor *)bezelViewColor
             BackgroundColor:(UIColor *)backgroundColor;

//文件处理
+ (NSArray *)getBundleImageArrayWithBundleName:(NSString *)bundleName
                                     imageName:(NSString *)imageName
                                         Count:(NSInteger)count;


//复杂界面流畅性
+ (NSAttributedString *)nodeAttributesStringText:(NSString *)text
                                       TextColor:(UIColor *)textColor
                                            Font:(UIFont *)font;

+ (ASTextNode *)nodeTextNodeAddNode:(ASDisplayNode *)addNode;

+ (ASDisplayNode *)nodeDisplayNodeAddNode:(ASDisplayNode *)addNode
                          BackgroundColor:(UIColor *)backgroundColor;

+ (ASButtonNode *)nodeButtonNodeAddNode:(ASDisplayNode *)addNode
                                  Title:(NSString *)title
                             TitleColor:(UIColor *)titleColor
                                   Font:(UIFont *)font
                           CornerRadius:(CGFloat)cornerRadius
                        BackgroundColor:(UIColor *)backgroundColor
               ContentVerticalAlignment:(ASVerticalAlignment)contentVerticalAlignment
             ContentHorizontalAlignment:(ASHorizontalAlignment)contentHorizontalAlignment;

+ (ASButtonNode *)nodeButtonNodeAddNode:(ASDisplayNode *)addNode
                                  Title:(NSString *)title
                             TitleColor:(UIColor *)titleColor
                                   Font:(UIFont *)font
                                  Image:(UIImage *)image
                         ImageAlignment:(ASButtonNodeImageAlignment)imageAlignment
                           CornerRadius:(CGFloat)cornerRadius
                        BackgroundColor:(UIColor *)backgroundColor
               ContentVerticalAlignment:(ASVerticalAlignment)contentVerticalAlignment
             ContentHorizontalAlignment:(ASHorizontalAlignment)contentHorizontalAlignment;

+ (ASImageNode *)nodeImageNodeAddNode:(ASDisplayNode *)addNode
                        ClipsToBounds:(BOOL)clipsToBounds
                          ContentMode:(UIViewContentMode)contentMode;

+ (ASNetworkImageNode *)nodeNetworkImageNodeAddNode:(ASDisplayNode *)addNode
                                      ClipsToBounds:(BOOL)clipsToBounds
                                        ContentMode:(UIViewContentMode)contentMode
                                       DefaultImage:(UIImage *)defaultImage;

@end
