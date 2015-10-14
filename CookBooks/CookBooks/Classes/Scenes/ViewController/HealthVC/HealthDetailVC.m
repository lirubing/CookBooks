//
//  HealthDetailVC.m
//  CookBooks
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HealthDetailVC.h"
#import "HealthListHelper.h"

@interface HealthDetailVC ()<UIWebViewDelegate>

@end

@implementation HealthDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //拼接的网址
    NSString *webViewUrl = [NSString stringWithFormat:@"http://iapi.ipadown.com/api/yangshen/detail.show.api.php?id=%@",self.webViewUrlID];
    //创建UIWebView
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    //设置代理
    webView.delegate = self;
    
    //创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:webViewUrl]];
    
    //加载webView网页
    [webView loadRequest:request];
    
    //添加webView
    [self.view addSubview:webView];
    
    
    
}




#pragma mark --UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
     [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('div')[1].style.display = 'none',document.getElementsByTagName('div')[13].style.display = 'none',document.getElementsByTagName('a')[0].style.display = 'none'"];
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
