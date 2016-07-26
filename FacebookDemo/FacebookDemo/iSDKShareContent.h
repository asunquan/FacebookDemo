//
//  iSDKShareContent.h
//  FacebookDemo
//
//  Created by Suns孙泉 on 16/7/25.
//  Copyright © 2016年 cyou-inc.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iSDKShareContent : NSObject

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *picture;

@property (nonatomic, copy) NSString *describe;

- (instancetype)initWithLinkURL:(NSString *)link
                      withTitle:(NSString *)title
                    withPicture:(NSString *)picture
                   withDescribe:(NSString *)describe;

@end
