//
//  HomeWebVC.m
//  CookBooks
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "HomeWebVC.h"

@interface HomeWebVC ()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView * webView;
@end

@implementation HomeWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self webView];

}


- (UIWebView*)webView{
    
    if (!_webView) {
    
        self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
        self.webView.delegate = self;
        [self.view addSubview:_webView];
        
        NSURL *url = [NSURL URLWithString:self.webString];
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
        [self.webView loadRequest:request];
    }
    
    return _webView;
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
//    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('li')[1].style.display = 'none',document.getElementsByTagName('a')[1].style.display = 'none',document.getElementsByTagName('a')[0].style.display = 'none',document.getElementsByTagName('span')[0].style.display = 'none,document.getElementsByTagName('span')[1].style.display = 'none'',document.getElementsByTagName('span')[2].style.display = 'none',document.getElementsByTagName('span')[3].style.display = 'none'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('a')[1].style.display = 'none'"];
//    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('span')[3].style.display = 'none'"];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
     [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('a')[1].style.display = 'none'"];
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
