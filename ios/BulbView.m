//
//  BulbView.m
//  LightApp
//
//  Created by Chau, Cuong | DCMS on 2020/04/18.
//

#import <Foundation/Foundation.h>

#import "React/RCTViewManager.h"
@interface RCT_EXTERN_MODULE(BulbViewManager, RCTViewManager)
RCT_EXPORT_VIEW_PROPERTY(isOn, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onStatusChanged, RCTDirectEventBlock)
@end
