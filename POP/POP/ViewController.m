//
//  ViewController.m
//  POP
//
//  Created by 浙大网新中研软件 on 2019/9/17.
//  Copyright © 2019 浙大网新中研软件. All rights reserved.
//
#import <pop/POP.h>
#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)CALayer *layer;

@property(nonatomic,strong)UIView *showView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 50, 50);
    layer.backgroundColor = [UIColor cyanColor].CGColor;
    layer.cornerRadius = 25.0;
    layer.position = self.view.center;
    self.layer = layer;
    [self.view.layer addSublayer:layer];
    
    // 创建view
    UIView *showView            = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    showView.alpha              = 0.f;
    showView.layer.cornerRadius = 50.f;
    showView.center             = CGPointMake(self.view.center.x, self.view.center.y-200);
    showView.backgroundColor    = [UIColor cyanColor];
    self.showView = showView;
    [self.view addSubview:showView];
    
    [self basicAnimation];
    //弹簧动画
    [self springAnimation];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}
//弹簧动画效果
- (void)springAnimation{
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(3.0, 3.0)];
    anim.springSpeed = 2;
    anim.dynamicsFriction = 2;
    [self.layer pop_addAnimation:anim forKey:nil
     ];
}
//衰减动画
- (void)decayAnimation{
    POPDecayAnimation *decayAnim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    decayAnim.velocity = @(300);
    [self.layer pop_addAnimation:decayAnim forKey:nil];
}
//基本动画
- (void)basicAnimation{
    POPBasicAnimation *basicAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
    basicAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    basicAnim.fromValue = [UIColor redColor];
    basicAnim.toValue = [UIColor cyanColor];
    basicAnim.duration = 4.0;
    basicAnim.autoreverses = YES;
    basicAnim.repeatForever = YES;
    [self.showView pop_addAnimation:basicAnim forKey:nil];
}
@end
