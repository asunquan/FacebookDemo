//
//  iSDKShareContent.m
//  FacebookDemo
//
//  Created by Suns孙泉 on 16/7/25.
//  Copyright © 2016年 cyou-inc.com. All rights reserved.
//

#import "iSDKShareContent.h"

@implementation iSDKShareContent

- (instancetype)initWithLinkURL:(NSString *)link
                      withTitle:(NSString *)title
                    withPicture:(NSString *)picture
                   withDescribe:(NSString *)describe
{
    self = [super init];
    if (self)
    {
        self.link = link;
        self.title = title;
        self.picture = picture;
        self.describe = describe;
    }
    return self;
}

@end
