//
// Created by wzg on 2018/9/10.
// Copyright (c) 2018 The Chromium Authors. All rights reserved.
//

#import "CustomeVc.h"


@implementation CustomeVc {

}
- (instancetype)init {
    self = [super init];
    if (self) {
        UIView *uiView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 300, 300)];
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        textView.text = @"dasdasdasdasdas";
        [uiView addSubview:textView];
        [self.view addSubview:uiView];
    }

    return self;
}

@end