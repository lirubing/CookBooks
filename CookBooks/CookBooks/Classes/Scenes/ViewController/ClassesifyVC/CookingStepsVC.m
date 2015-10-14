//
//  CookingStepsVC.m
//  CookBooks
//
//  Created by lanou3g on 15/10/10.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "CookingStepsVC.h"
#import "HeaderURL.h"
#import "UIImageView+WebCache.h"
#import "DetailsListHelpers.h"
#import "MaterialCell.h"
#import "AFHTTPRequestOperationManager.h"
#import "SmallClassesifyModel.h"
#import "SmallClassesifyHelpers.h"
#import "ClassesifyHelpers.h"
#import "DetailsListModel.h"
#import "CookingDetailsCell.h"



@interface CookingStepsVC ()
// 区头属性
@property (nonatomic,strong) UIView *header;

// 材料
@property (nonatomic,strong) NSMutableArray *mutNameArr;
// 步骤
@property (nonatomic,strong) NSMutableArray *mutStepArr;
@property (nonatomic,strong)NSString *str;
@end

@implementation CookingStepsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.mutNameArr.count;
    }else{
        return self.mutStepArr.count;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [self textHeight:_str] + 20;
    }
    return [self textHeight:_str] + 20;
}

- (CGFloat)textHeight:(NSString *)str{
    
    
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    
    
    CGRect rect = [str boundingRectWithSize:CGSizeMake(335, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    return rect.size.height;
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        // 材料
        NSDictionary *dict = self.mutNameArr[indexPath.row];
        NSString *name = dict[@"name"];
        cell.textLabel.text = name;
        _str = cell.textLabel.text;
        // 自动换行
        cell.textLabel.numberOfLines = 0;
        return cell;

    }else{
        // 步骤
        NSDictionary *dict = self.mutStepArr[indexPath.row];
        NSString *step = dict[@"details"];
        cell.textLabel.text = step;
        _str = cell.textLabel.text;
        // 自动换行
        cell.textLabel.numberOfLines = 0;
        return cell;
    }

}
// 区头设置
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return @"做法:";
    }
    return @"材料:";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 改变选中cell后状态
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];

}


// 懒加载
- (NSMutableArray *)mutNameArr{
    if (_mutNameArr == nil) {
        _mutNameArr = [NSMutableArray array];
    }
    return _mutNameArr;
}

- (NSMutableArray *)mutStepArr
{
    if (_mutStepArr == nil) {
        _mutStepArr = [NSMutableArray array];
    }
    return _mutStepArr;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// 区头重写setting方法
-(void)setUrlstr:(NSString *)urlstr
{
    if (_urlstr == nil) {
        _urlstr = urlstr;
    }
    // 区头
    _header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 210)];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 210)];
    // 区头上添加照片
    _header.backgroundColor = [UIColor colorWithWhite:0.915 alpha:1.000];
    self.tableView.tableHeaderView = _header;
    [imgView sd_setImageWithURL:[NSURL URLWithString:urlstr]];
    [_header addSubview:imgView];
    [self.tableView reloadData];
}

// 存储材料
//- (NSMutableArray *)nameArr
//{
//    if (_nameArr == nil) {
//        _nameArr = [NSMutableArray array];
//    }
//    return _nameArr;
//}
-(void)setName:(NSInteger)name
{

    if (_name == 0) {
        _name = name;
    }
    self.mutNameArr = [[DetailsListHelpers detailsListShare].nameArr [name]mutableCopy];
    
    [self.tableView reloadData];
}

-(void)setStep:(NSInteger)step
{

    if (_step == 0) {
        _step = step;
    }
    self.mutStepArr = [[DetailsListHelpers detailsListShare].stepArr[step]mutableCopy];
    
    [self.tableView reloadData];

}
@end
