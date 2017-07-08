//
//  ViewController.m
//  Swipes
//
//  Created by Vasilii on 08.07.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "ViewController.h"

#define kMinimumGestureLength 25 
#define kMaximumVariance 5

//@interface ViewController ()

//@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)eraseText
{
    self.label.text = @"";
}

#pragma mark -

//В этом методе мы только извлекаем любое касание из совокупности touches и сохраняем его точку.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.gestureStartPoint = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    //получаем текущее положение пальца пользователя.
    UITouch *touch = [touches anyObject];
    CGPoint currentPosition = [touch locationInView:self.view];
    //После этого определяем, насколько далеко палец пользователя переместился как по горизонтали, так и по вертикали относительно исходного положения.
    CGFloat deltaX = fabs(self.gestureStartPoint.x - currentPosition.x); CGFloat deltaY = fabs(self.gestureStartPoint.y - currentPosition.y);
    //проверяем как и насколько сделано перемещение
    if (deltaX >= kMinimumGestureLength && deltaY <= kMaximumVariance) {
        self.label.text = @"Horizontal swipe detected";
        [self performSelector:@selector(eraseText)
                   withObject:nil afterDelay:2];
    } else if (deltaY >= kMinimumGestureLength &&
               deltaX <= kMaximumVariance){
        self.label.text = @"Vertical swipe detected";
        //удалаем данные с экрана через 2 секунды
        [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
    } }


@end
