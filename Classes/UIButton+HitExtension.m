//
//  UIButton+PWExtension.m
//  Playwings
//
//  Created by KimTae jun on 2015. 10. 8..
//  Copyright © 2015년 Fridaynoons. All rights reserved.
//

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