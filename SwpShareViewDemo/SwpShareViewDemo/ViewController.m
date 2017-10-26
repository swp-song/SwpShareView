//
//  ViewController.m
//  SwpShareViewDemo
//
//  Created by swp_song on 2016/9/30.
//  Copyright © 2016年 swp_song. All rights reserved.
//

#import "ViewController.h"

#import "SwpShareHeader.h"

@interface ViewController () <SwpShareViewDelegate>


@property (nonatomic, weak) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickButton:(UIButton *)button {


    

    // 自定义分享图标
    SwpShareModel *teype = [SwpShareModel swpShareWithShareKey:@"custom" setSwpShareTitle:@"自定义" setSwpShareImageName:@"share_custom" setSwpTripartiteFrameworkShareType:@200];
    
    NSArray *datas =  @[SwpShareToQQ, SwpShareToQzone, SwpShareToTencent, SwpShareToWechatSession, SwpShareToWechatTimeline, SwpShareToSina, SwpShareToCopyURL];
    
    SwpShareView.swpShareViewShowInitWithDelegate(datas, self)
    // 追加自定义 item
    .swpShareViewCustomItems(@[teype])
    // 未安装软件处理
    .swpShareItemType(SwpShareItemTypeEnabled)
    // Title 字体大小
    .swpShareTitleSize(15)
    // 文字
    .swpShareTitle(@"分享")
    // item 点击回调
    .swpShareListViewDidSelectIndexBlockChain(^(SwpShareView *swpShareView, NSInteger didSelectIndex, SwpShareModel *swpShare){
        NSLog(@"%@", swpShare.swpShareKey);
    })
    // 页面关闭回调
    .swpShareViewCloseBlockChain(^(SwpShareView *swpShareView, SwpShareModel *swpShare){
        NSLog(@"Block 页面关闭了");
        NSLog(@"%@", swpShare.swpShareKey);
    });

}



// 代理 回调
- (void)swpShareView:(SwpShareView *)swpShareView didSelectIndex:(NSInteger)index swpShare:(SwpShareModel *)swpShare {
    NSLog(@"%@", swpShare.swpShareKey);

}

// 页面 关闭
- (void)swpShareView:(SwpShareView *)swpShareView closeSwpShareView:(SwpShareModel *)swpShare {
    NSLog(@"Delegate 页面关闭了");
    NSLog(@"%@", swpShare.swpShareKey);
}



@end
