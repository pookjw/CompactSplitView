//
//  UISplitViewController+AlwaysExpanded.mm
//  CompactSplitView
//
//  Created by Jinwoo Kim on 7/17/24.
//

#import "UISplitViewController+AlwaysExpanded.h"
#import <objc/message.h>
#import <objc/runtime.h>

namespace cs_UIPanelController {
    void *isAlwaysExpandedKey = &isAlwaysExpandedKey;
    
    namespace _willCollapseWithNewTraitCollection_oldTraitCollection {
        BOOL (*original)(id, SEL, UITraitCollection *, UITraitCollection *);
        BOOL custom(id self, SEL _cmd, UITraitCollection *newTraitCollection, UITraitCollection *oldTraitCollection) {
            __kindof UIViewController *owningViewController = reinterpret_cast<id (*)(id, SEL)>(objc_msgSend)(self, sel_registerName("owningViewController"));
            
            BOOL shouldCallOriginal;
            if (owningViewController == nil) {
                shouldCallOriginal = YES;
            } else {
                NSNumber *isAlwaysExpanded = objc_getAssociatedObject(owningViewController, isAlwaysExpandedKey);
                
                if (isAlwaysExpanded == nil) {
                    shouldCallOriginal = YES;
                } else {
                    shouldCallOriginal = !(isAlwaysExpanded.boolValue);
                }
            }
            
            if (shouldCallOriginal) {
                return original(self, _cmd, newTraitCollection, oldTraitCollection);
            } else {
                return NO;
            }
        }
        
        void swizzle() {
            Method method = class_getInstanceMethod(objc_lookUpClass("UIPanelController"), sel_registerName("_willCollapseWithNewTraitCollection:oldTraitCollection:"));
            original = reinterpret_cast<decltype(original)>(method_getImplementation(method));
            method_setImplementation(method, reinterpret_cast<IMP>(custom));
        }
    }
    
    
    namespace _willExpandWithNewTraitCollection_oldTraitCollection {
        BOOL (*original)(id, SEL, UITraitCollection *, UITraitCollection *);
        BOOL custom(id self, SEL _cmd, UITraitCollection *newTraitCollection, UITraitCollection *oldTraitCollection) {
            __kindof UIViewController *owningViewController = reinterpret_cast<id (*)(id, SEL)>(objc_msgSend)(self, sel_registerName("owningViewController"));
            
            BOOL shouldCallOriginal;
            if (owningViewController == nil) {
                shouldCallOriginal = YES;
            } else {
                NSNumber *isAlwaysExpanded = objc_getAssociatedObject(owningViewController, isAlwaysExpandedKey);
                
                if (isAlwaysExpanded == nil) {
                    shouldCallOriginal = YES;
                } else {
                    shouldCallOriginal = !(isAlwaysExpanded.boolValue);
                }
            }
            
            if (shouldCallOriginal) {
                return original(self, _cmd, newTraitCollection, oldTraitCollection);
            } else {
                return YES;
            }
        }
        
        void swizzle() {
            Method method = class_getInstanceMethod(objc_lookUpClass("UIPanelController"), sel_registerName("_willExpandWithNewTraitCollection:oldTraitCollection:"));
            original = reinterpret_cast<decltype(original)>(method_getImplementation(method));
            method_setImplementation(method, reinterpret_cast<IMP>(custom));
        }
    }
}

namespace cs_UISlidingBarConfiguration {
    namespace leadingMayBeHidden {
        BOOL (*original)(id, SEL);
        BOOL custom(id self, SEL _cmd) {
            return NO;
        }
        void swizzle() {
            Method method = class_getInstanceMethod(objc_lookUpClass("UISlidingBarConfiguration"), sel_registerName("leadingMayBeHidden"));
            original = reinterpret_cast<decltype(original)>(method_getImplementation(method));
            method_setImplementation(method, reinterpret_cast<IMP>(custom));
        }
    }
    
    namespace trailingMayBeHidden {
        BOOL (*original)(id, SEL);
        BOOL custom(id self, SEL _cmd) {
            return NO;
        }
        void swizzle() {
            Method method = class_getInstanceMethod(objc_lookUpClass("UISlidingBarConfiguration"), sel_registerName("trailingMayBeHidden"));
            original = reinterpret_cast<decltype(original)>(method_getImplementation(method));
            method_setImplementation(method, reinterpret_cast<IMP>(custom));
        }
    }
    
    namespace supplementaryMayBeHidden {
        BOOL (*original)(id, SEL);
        BOOL custom(id self, SEL _cmd) {
            return NO;
        }
        void swizzle() {
            Method method = class_getInstanceMethod(objc_lookUpClass("UISlidingBarConfiguration"), sel_registerName("supplementaryMayBeHidden"));
            original = reinterpret_cast<decltype(original)>(method_getImplementation(method));
            method_setImplementation(method, reinterpret_cast<IMP>(custom));
        }
    }
}

namespace cs_UIPanelInternalState {
    namespace _allowedLeadingWidthsForParentWidth {
        NSArray<NSNumber *> *(*original)(id, SEL, CGFloat);
        NSArray<NSNumber *> *custom(id self, SEL _cmd, CGFloat parentWidth) {
            NSArray<NSNumber *> *originalResult = original(self, _cmd, parentWidth);
            
            if (NSNumber *firstObject = originalResult.firstObject) {
                if (firstObject.doubleValue >= parentWidth * 0.2) {
                    return @[@(parentWidth * 0.2)];
                } else {
                    return originalResult;
                }
            } else {
                return @[@(parentWidth * 0.2)];
            }
        }
        void swizzle() {
            Method method = class_getInstanceMethod(objc_lookUpClass("_UIPanelInternalState"), sel_registerName("_allowedLeadingWidthsForParentWidth:"));
            original = reinterpret_cast<decltype(original)>(method_getImplementation(method));
            method_setImplementation(method, reinterpret_cast<IMP>(custom));
        }
    }
    
    namespace _allowedSupplementaryWidthsForParentWidth {
        NSArray<NSNumber *> *(*original)(id, SEL, CGFloat);
        NSArray<NSNumber *> *custom(id self, SEL _cmd, CGFloat parentWidth) {
            NSArray<NSNumber *> *originalResult = original(self, _cmd, parentWidth);
            
            if (NSNumber *firstObject = originalResult.firstObject) {
                if (firstObject.doubleValue >= parentWidth * 0.2) {
                    return @[@(parentWidth * 0.2)];
                } else {
                    return originalResult;
                }
            } else {
                return @[@(parentWidth * 0.2)];
            }
        }
        void swizzle() {
            Method method = class_getInstanceMethod(objc_lookUpClass("_UIPanelInternalState"), sel_registerName("_allowedSupplementaryWidthsForParentWidth:"));
            original = reinterpret_cast<decltype(original)>(method_getImplementation(method));
            method_setImplementation(method, reinterpret_cast<IMP>(custom));
        }
    }
    
    namespace _allowedTrailingWidthsForParentWidth {
        NSArray<NSNumber *> *(*original)(id, SEL, CGFloat);
        NSArray<NSNumber *> *custom(id self, SEL _cmd, CGFloat parentWidth) {
            NSArray<NSNumber *> *originalResult = original(self, _cmd, parentWidth);
            
            if (NSNumber *firstObject = originalResult.firstObject) {
                if (firstObject.doubleValue >= parentWidth * 0.2) {
                    return @[@(parentWidth * 0.2)];
                } else {
                    return originalResult;
                }
            } else {
                return @[@(parentWidth * 0.2)];
            }
        }
        void swizzle() {
            Method method = class_getInstanceMethod(objc_lookUpClass("_UIPanelInternalState"), sel_registerName("_allowedTrailingWidthsForParentWidth:"));
            original = reinterpret_cast<decltype(original)>(method_getImplementation(method));
            method_setImplementation(method, reinterpret_cast<IMP>(custom));
        }
    }
}

@implementation UISplitViewController (AlwaysExpanded)

+ (void)load {
    cs_UIPanelController::_willCollapseWithNewTraitCollection_oldTraitCollection::swizzle();
    cs_UIPanelController::_willExpandWithNewTraitCollection_oldTraitCollection::swizzle();
    cs_UISlidingBarConfiguration::leadingMayBeHidden::swizzle();
    cs_UISlidingBarConfiguration::trailingMayBeHidden::swizzle();
    cs_UISlidingBarConfiguration::supplementaryMayBeHidden::swizzle();
    cs_UIPanelInternalState::_allowedLeadingWidthsForParentWidth::swizzle();
    cs_UIPanelInternalState::_allowedSupplementaryWidthsForParentWidth::swizzle();
    cs_UIPanelInternalState::_allowedTrailingWidthsForParentWidth::swizzle();
}

- (BOOL)cs_isAlwaysExpanded {
    NSNumber *isAlwaysExpanded = objc_getAssociatedObject(self, cs_UIPanelController::isAlwaysExpandedKey);
    
    if (isAlwaysExpanded == nil) return NO;
    
    return isAlwaysExpanded.boolValue;
}

- (void)cs_setAlwaysExpanded:(BOOL)cs_alwaysExpanded {
    BOOL oldValue = self.cs_isAlwaysExpanded;
    
    objc_setAssociatedObject(self, cs_UIPanelController::isAlwaysExpandedKey, @(cs_alwaysExpanded), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (oldValue != cs_alwaysExpanded) {
        // UISplitViewControllerPanelImpl
        id _panelImpl = reinterpret_cast<id (*)(id, SEL)>(objc_msgSend)(self, sel_registerName("_panelImpl"));
        
        // UIPanelController *
        id panelController = reinterpret_cast<id (*)(id, SEL)>(objc_msgSend)(_panelImpl, sel_registerName("panelController"));
        // -[UIPanelController _updateForTraitCollection:oldTraitCollection:withTransitionCoordinator:]
        
        UITraitCollection *traitCollection = self.traitCollection;
        
        reinterpret_cast<void (*)(id, SEL, id, id, id)>(objc_msgSend)(panelController, sel_registerName("_updateForTraitCollection:oldTraitCollection:withTransitionCoordinator:"), traitCollection, traitCollection, nil);
    }
}

@end
