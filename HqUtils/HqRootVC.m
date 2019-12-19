//
//  ViewController.m
//  HqUtils
//
//  Created by macpro on 2018/1/24.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import "HqRootVC.h"
#import "HqKeyboardUseVC.h"
#import "HqDatePickerVC.h"
#import "HqShareVC.h"
#import "HqTestVC.h"
#import "HqRegExVC.h"
#import "HqAuthIDVC.h"
#import "HqAlertVC.h"
#import "HqCustomAlertVC.h"
#import "hqRefreshVC.h"
#import "HqTableView.h"
#import "HqKVOTestVC.h"
#import "HqClipVC.h"

#import "HqNSInvocationVC.h"
#import "HqUIResponderVC.h"
#import "HqThemeVC.h"
#import "HQSegmentPageViewController.h"
#import "HqCustomSegmentPageVC.h"
#import "HSegmentTestVC.h"

#import "HqWebViewTestVC.h"
#import "HqInvokeManagerVC.h"
#import "HqCodeVC.h"
#import "HqTableViewTestVC.h"

#import "HqShortArticleVC.h"

#import "HqMutilImagePickerVC.h"
#import "HqGCDVC.h"
#import "HqMsgForwardVC.h"
#import "HqZLPhotoBrowserVC.h"
#import "HqCoreTextVC.h"

#import "HqTableViewVC.h"
#import "HqPhotoPickerVC.h"
#import "HqTextBindVC.h"
#import "HqImageBrowserVC.h"
#import "HqBoxImageViewVC.h"

#import "HqContainerVC.h"
#import "HqkLineVC.h"

#import "HqChatRoomListVC.h"
#import "HqChatVC.h"

@interface HqRootVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *titles;


@end

@implementation HqRootVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HqUtils";
    _titles = @[@"HqCodeVC",@"HqChatRoomListVC",@"HqkLineVC",@"HqContainerVC",@"HqBoxImageViewVC",@"HqImageBrowserVC",@"HqTextBindVC",@"HqPhotoPickerVC",@"HqTableViewVC",@"HqCoreTextVC",@"HqMsgForwardVC",@"HqGCDVC",@"HqMutilImagePickerVC",@"HqZLPhotoBrowserVC", @"HqShortArticleVC",@"HqTableViewTestVC",@"HqInvokeManagerVC",@"HqWebViewTestVC",@"HSegmentTestVC",@"HQSegmentPageViewController",@"HqCustomSegmentPageVC",@"hqRefreshVC",@"HqColorImageVC",@"HqRegExVC",@"HqKVOTestVC",@"HqAuthIDVC",@"HqClipVC",@"HqNSInvocationVC",@"HqUIResponderVC",@"HqThemeVC",@"HqTestVC"];
    UIBarButtonItem *rbtn = [[UIBarButtonItem alloc] initWithTitle:@"Alert" style:UIBarButtonItemStylePlain target:self action:@selector(enterAlert:)];
    self.navigationItem.rightBarButtonItem = rbtn;

    [self initView];

//    UIImage *borderImage = [UIImage imageNamed:@"btn_border_bg"];
//    borderImage = [borderImage resizableImageWithCapInsets:UIEdgeInsetsMake(10, 30, 10, 30)];
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, SCREEN_WIDTH-20, 60)];
//
//    btn.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:btn];
//    borderImage = [self getBorderSize:btn.bounds.size cornerRaius:30];
//    [btn setBackgroundImage:borderImage forState:UIControlStateNormal];
    
}
- (UIImage *)getBgImageWithSize:(CGSize)cgsize cornerRaius:(CGFloat)cornerRaius{
    UIView *view = [[UIView alloc] init];
    view.bounds =CGRectMake(0, 0, cgsize.width, cgsize.height);
    if (cornerRaius>0) {
        view.layer.cornerRadius = cornerRaius;
        view.clipsToBounds = YES;
    }
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSLog(@"image==%@",image);
    return image;
}
- (UIImage *)getBorderImageWithSize:(CGSize)cgsize cornerRaius:(CGFloat)cornerRaius{
    UIView *view = [[UIView alloc] init];
    view.bounds =CGRectMake(0, 0, cgsize.width, cgsize.height);
    view.layer.borderWidth = 1;
    view.layer.borderColor = [UIColor redColor].CGColor;
    if (cornerRaius>0) {
        view.layer.cornerRadius = cornerRaius;
        view.clipsToBounds = YES;
    }
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSLog(@"image==%@",image);
    return image;
}
// 普通的获取UUID的方法
- (NSString *)getUUID {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString *result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    return result;
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)enterAlert:(UIBarButtonItem *)sender{

    HqCustomAlertVC *alert = [[HqCustomAlertVC alloc] init];
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ) {
        
        UIViewController *popRootVC = [[UIViewController alloc] init];
        popRootVC.view.backgroundColor = [UIColor redColor];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:popRootVC];
        popRootVC.title = @"POP";
        
        UIPopoverController *popVC = [[UIPopoverController alloc] initWithContentViewController:nav];
        popVC.popoverContentSize = CGSizeMake(200, 300);
    
        [popVC presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }else{
        [alert showWithVC:self];
    }
}
- (void)initView{
    _tableView = [[HqTableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titles.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentfier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentfier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentfier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *vcname = self.titles[indexPath.row];
    Class vcClass = NSClassFromString(vcname);
    UIViewController *vc = [vcClass new];
    vc.title = vcname;
    [self.navigationController pushViewController:vc animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
