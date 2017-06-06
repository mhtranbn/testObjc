//
//  PKIZoomVC.m
//  testObjc
//
//  Created by mhtran on 6/6/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import "PKIZoomVC.h"
#define ZOOM_STEP 1.5

@interface PKIZoomVC ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) UIScrollView* scrollView;
@property (weak, nonatomic) UIImageView* photo;
@property (weak, nonatomic) UILabel* scaleLabel;
@property (nonatomic, strong) NSString *nameImage;
@property (nonatomic, strong) NSString *countImage;

@end

@implementation PKIZoomVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Set View
    self.view.backgroundColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.nameImageLabel.text = _nameImage;
    self.numberImageLabel.text = _countImage;
    // ScrollView
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.minimumZoomScale = 0.1;
    scrollView.maximumZoomScale = 10;
    scrollView.zoomScale = 1.0;
    scrollView.clipsToBounds = true;
    
    // ImageView
    UIImageView* photo = [[UIImageView alloc] initWithFrame:scrollView.bounds];
    photo.image = [UIImage imageNamed:[_nameImage stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    photo.contentMode = UIViewContentModeScaleAspectFit;
    
    // Hứng sự kiện người dùng tap vào ảnh
    photo.userInteractionEnabled = true;
    photo.multipleTouchEnabled = true;
    
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.delegate = self;
    [photo addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onDoubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.delegate = self;
    [photo addGestureRecognizer:doubleTap];
    
    [scrollView addSubview:photo];
    [self.view addSubview:scrollView];
    [self.view bringSubviewToFront:self.closeButton];
    [self.view bringSubviewToFront:self.nameImageLabel];
    [self.view bringSubviewToFront:self.numberImageLabel];
    
    // Sau khi scrollView, photo được gắn vào View cha, có con trỏ strong thì mới gắn vào weak property
    self.scrollView = scrollView;
    self.photo = photo;
    
    // Set Label
    UILabel* scaleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    scaleLabel.textAlignment = NSTextAlignmentRight;
    scaleLabel.text = [NSString stringWithFormat:@"%2.2f", scrollView.zoomScale];
    
    // add Label vao NavigationBar
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithCustomView:scaleLabel];
    [self.navigationItem setRightBarButtonItem:barButton];
    self.scaleLabel = scaleLabel;
    
    // Nếu ko có thì single tap sẽ nhận xong double tap lại nhận
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
}

- (void)setData:(NSString *)nameImage :(NSString *)numberImage{
    self.nameImage = [NSString stringWithFormat:@"%@",nameImage];
    self.countImage = [NSString stringWithFormat:@"%@",numberImage];
}

- (void) onTap: (UIGestureRecognizer*) tap {
    CGPoint tapPoint = [tap locationInView:self.photo]; // Bắt tọa độ khi click vào màn hình
    NSLog(@"%f - %f", tapPoint.x, tapPoint.y);
    float newScale = self.scrollView.zoomScale * ZOOM_STEP;
    [self zoomRectForScale: newScale withCenter: tapPoint];
}

- (void) onDoubleTap: (UIGestureRecognizer*) tap {
    CGPoint tapPoint = [tap locationInView:self.photo];
    float newScale = self.scrollView.zoomScale / ZOOM_STEP;
    [self zoomRectForScale: newScale withCenter: tapPoint];
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.photo;
}

- (void) zoomRectForScale: (float) scale withCenter: (CGPoint) center {
    CGRect zoomRect;
    CGSize scrollViewSize = self.scrollView.bounds.size;
    zoomRect.size.width = scrollViewSize.width / scale;
    zoomRect.size.height = scrollViewSize.height / scale;
    
    // choose an origin so as to get the right center
    zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    
    [self.scrollView zoomToRect:zoomRect animated:YES];
    
    self.scaleLabel.text = [NSString stringWithFormat:@"%2.2f", self.scrollView.zoomScale];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
- (IBAction)closeAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

@end
