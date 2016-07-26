//
//  ViewController.m
//  FacebookDemo
//
//  Created by Suns孙泉 on 16/7/18.
//  Copyright © 2016年 cyou-inc.com. All rights reserved.
//

#import "ViewController.h"

#import "iSDKHelper.h"
#import "iSDKShareContent.h"

static NSString * const CELLID = @"cellID";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

{
    UITableView *demoTV;
    NSArray *list;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initList];
    
    demoTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 20.f, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 20.f)
                                          style:UITableViewStylePlain];
    demoTV.delegate = self;
    demoTV.dataSource = self;
    [self.view addSubview:demoTV];
}

- (void)initList
{
    list = @[@"Login",
             @"Share",
             @"Invite",
             @"Request",
             @"Friends"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return list.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CELLID];
    }
    cell.textLabel.text = list[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
            [self facebookLogin];
            break;
        case 1:
            [self facebookShare];
            break;
        case 2:
            [self facebookInvite];
            break;
        case 3:
            [self facebookRequest];
            break;
        case 4:
            [self facebookFriends];
            break;
        default:
            break;
    }
}

- (void)facebookLogin
{
    [iSDKHelper facebookLoginSuccess:^
     {
         NSLog(@"facebook login success");
     }
                              cancel:^
     {
         NSLog(@"facebook login cancelled");
     }
                             failure:^(NSError *error)
     {
         NSLog(@"facebook login failed : %@", error);
     }];
}

- (void)facebookShare
{
    iSDKShareContent *content = [[iSDKShareContent alloc] init];
    content.link = @"http://www.changyou.com";
    content.title = @"MAI! MAI! MAI!";
    content.picture = @"http://i0.cy.com/xtl3d/pic/2014/10/17/1.png";
    content.describe = @"Show me the money!";
    
    [iSDKHelper facebookShareWithContent:content
                                 success:^
     {
         NSLog(@"facebook share success");
     }
                                  cancel:^
     {
         NSLog(@"facebook share cancelled");
     }
                                 failure:^(NSError *error)
     {
         NSLog(@"facebook share failed : %@", error);
     }];
}

- (void)facebookInvite
{
    iSDKShareContent *content = [[iSDKShareContent alloc] init];
    content.link = @"https://fb.me/1031153556936829";
    content.picture = @"http://i0.cy.com/xtl3d/pic/2014/10/17/1.png";
    
    [iSDKHelper facebookInviteWithContent:content
                                  success:^
     {
         NSLog(@"facebook invite success");
     }
                                   cancel:^
     {
         NSLog(@"facebook invite cancelled");
     }
                                  failure:^(NSError *error)
     {
         NSLog(@"facebook invite failed : %@", error);
     }];
}

- (void)facebookRequest
{
    iSDKShareContent *content = [[iSDKShareContent alloc] init];
    content.title = @"title";
    content.describe = @"message";
    
    [iSDKHelper facebookRequestWithContent:content
                                   success:^
     {
         NSLog(@"facebook request success");
     }
                                    cancel:^
     {
         NSLog(@"facebook request cancelled");
     }
                                   failure:^(NSError *error)
     {
         NSLog(@"facebook request failed : %@", error);
     }];
}

- (void)facebookFriends
{
    [iSDKHelper facebookFriendsListSuccess:^(id result)
     {
         NSLog(@"facebook friends list : %@", result);
     }
                                   failure:^(NSError *error)
     {
         NSLog(@"facebook request friends list failed : %@", error);
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
