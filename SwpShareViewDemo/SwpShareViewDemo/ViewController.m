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

    SwpShareView *swpShareView = [SwpShareView swpShareViewShowWithData:@[
                                                                          SwpShareToQQ,
                                                                          SwpShareToQzone,
                                                                          SwpShareToTencent,
                                                                          SwpShareToWechatSession,
                                                                          SwpShareToWechatTimeline,
                                                                          SwpShareToSina,
                                                                          SwpShareToCopyURL] setDelegate:self];
    

    // 修改 分享 显示 title 属性
    swpShareView.swpShareTitleSize(15).swpShareTitle(@"分享").swpShareTitleColor([UIColor redColor]);
    
    // block 回调
    [swpShareView swpShareListViewDidSelectIndex:^(SwpShareView * _Nonnull swpShareView, NSInteger didSelectIndex, SwpShareModel * _Nonnull swpShare) {
        NSLog(@"%@", swpShare.swpShareKey);
    }];

}



// 代理 回调
- (void)swpShareView:(SwpShareView *)swpShareView didSelectIndex:(NSInteger)index swpShare:(SwpShareModel *)swpShare {
    NSLog(@"%@", swpShare.swpShareKey);
}


- (void)swpShareViewClose:(SwpShareView *)swpShareView {
    NSLog(@"页面已关闭");
}


@end
