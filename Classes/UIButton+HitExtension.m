//    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//    Version 2, December 2004
//
//    Copyright (C) 2013-2015 KIM TAE JUN <korean.darren@gmail.com>
//
//    Everyone is permitted to copy and distribute verbatim or modified
//    copies of this license document, and changing it is allowed as long
//    as the name is changed.
//
//    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
//    0. You just DO WHAT THE FUCK YOU WANT TO.

#import "UIButton+HitExtension.h"

// SDK
#import <objc/runtime.h>

static NSString * const HitExtensionHitEdgeInsetsKey = @"HitExtensionHitEdgeInsetsKey";

@implementation UIButton (HitExtension)

@dynamic hitEdgeInsets;

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL isZeroInsets = UIEdgeInsetsEqualToEdgeInsets(self.hitEdgeInsets, UIEdgeInsetsZero);
    if (isZeroInsets || !self.enabled || self.hidden)
        return [super pointInside:point withEvent:event];
    
    CGRect bounds = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(bounds, self.hitEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}

#pragma mark - Setter

- (void)setHitEdgeInsets:(UIEdgeInsets)hitEdgeInsets
{
    NSValue *value = [NSValue value:&hitEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &HitExtensionHitEdgeInsetsKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Getter

- (UIEdgeInsets)hitEdgeInsets
{
    NSValue *edgeInsetsValue = objc_getAssociatedObject(self, &HitExtensionHitEdgeInsetsKey);
    if (edgeInsetsValue) {
        UIEdgeInsets edgeInsets;
        [edgeInsetsValue getValue:&edgeInsets];
        return edgeInsets;
    }
    
    return UIEdgeInsetsZero;
}

@end