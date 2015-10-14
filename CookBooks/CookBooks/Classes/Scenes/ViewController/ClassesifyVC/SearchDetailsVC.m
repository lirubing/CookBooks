//
//  SearchDetailsVC.m
//  CookBooks
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 李彬彬. All rights reserved.
//

#import "SearchDetailsVC.h"
#import "UIImageView+WebCache.h"
#import "DetailsListHelpers.h"
#import "SearchViewController.h"
#import "MaterialModel.h"

@interface SearchDetailsVC ()

@property (nonatomic,strong)NSString *str;


@end

@implementation SearchDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self header];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
  
}

// 区头
- (void)header
{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 210)];
    imgView.backgroundColor = [UIColor colorWithWhite:0.890 alpha:1.000];
    [imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://pic.ecook.cn/web/%@.jpg!m3",_imgURL]]];
    self.tableView.tableHeaderView = imgView;
    [self.tableView reloadData];
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
    // Return the number of rows in the section.
    if (section == 0) {
        return self.nameArr.count;
    }else{
        return self.stepArr.count;
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
        NSDictionary *dict = self.nameArr[indexPath.row];
        NSString *name = dict[@"name"];
        cell.textLabel.text = name;
        _str = cell.textLabel.text;
        // 自动换行
        cell.textLabel.numberOfLines = 0;
        return cell;
        
    }else{
        // 步骤
        NSDictionary *dict = self.stepArr[indexPath.row];
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

// 重写set
- (void)setImgURL:(NSString *)imgURL
{
    if (_imgURL == nil) {
        _imgURL = imgURL;
    }
    
}

- (NSMutableArray *)nameArr{
    if (_nameArr == nil) {
        _nameArr = [NSMutableArray new];
    }
    return _nameArr;
}

- (NSMutableArray *)stepArr
{
    if (_stepArr == nil) {
        _stepArr = [NSMutableArray new];
    }
    return _stepArr;
}
@end
