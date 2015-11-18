//
//  UIBarButtonItem+TintColor.m
//  UIBarButtonItem+TintColor
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UIBarButtonItem+TintColor.h"
#import "DKNightVersionManager.h"
#import "objc/runtime.h"

@interface UIBarButtonItem ()

@property (nonatomic, strong) UIColor *normalTintColor;

@end

@implementation UIBarButtonItem (TintColor)

+ (void)load {
    static dispatch_once_t onceToken;                                              
    dispatch_once(&onceToken, ^{                                                   
        Class class = [self class];                                                
        SEL originalSelector = @selector(setTintColor:);                                  
        SEL swizzledSelector = @selector(hook_setTintColor:);                                 
        Method originalMethod = class_getInstanceMethod(class, originalSelector);  
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);  
        BOOL didAddMethod =                                                        
        class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));                   
        if (didAddMethod){
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));           
        } else {                                                                   
            method_exchangeImplementations(originalMethod, swizzledMethod);        
        }
        {
            SEL originalSelector = @selector(awakeFromNib);
            SEL swizzledSelector = @selector(hook_awakeFromNib);
            Method originalMethod = class_getInstanceMethod(class, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
            BOOL didAddMethod =
            class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
            if (didAddMethod){
                class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            } else {
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    });
    [DKNightVersionManager addClassToSet:self.class];
}

- (void)hook_awakeFromNib
{
    self.normalTintColor = self.tintColor;
    [self hook_awakeFromNib];
}

- (void)hook_setTintColor:(UIColor*)tintColor {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNormal) [self setNormalTintColor:tintColor];
    [self hook_setTintColor:tintColor];
}

- (UIColor *)nightTintColor {
    UIColor *nightColor = objc_getAssociatedObject(self, @selector(nightTintColor));
    if (nightColor) {
        return nightColor;
    } else {
        UIColor *resultColor = [self.nightJoin boolValue] ? barButtonItemTintColor : self.normalTintColor;
        return resultColor;
    }
}

- (void)setNightTintColor:(UIColor *)nightTintColor {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) [self setTintColor:nightTintColor];
    objc_setAssociatedObject(self, @selector(nightTintColor), nightTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)normalTintColor {
    return objc_getAssociatedObject(self, @selector(normalTintColor))?: [UIColor blueColor];
}

- (void)setNormalTintColor:(UIColor *)normalTintColor {
    objc_setAssociatedObject(self, @selector(normalTintColor), normalTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)nightJoin {
    return objc_getAssociatedObject(self, @selector(nightJoin));
}

- (void)setNightJoin:(NSString *)nightJoin {
    objc_setAssociatedObject(self, @selector(nightJoin), nightJoin, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
