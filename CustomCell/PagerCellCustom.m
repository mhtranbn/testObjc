//
//  PagerCellCustom.m
//  testObjc
//
//  Created by mhtran on 6/6/17.
//  Copyright © 2017 mhtran. All rights reserved.
//

#import "PagerCellCustom.h"

@implementation PagerCellCustom

-(NSMutableArray *)imagesArray {
    return _imagesArray;
}

-(NSMutableArray *)setImageArray:(NSMutableArray *)newImageArray{
    _imagesArray = newImageArray;
    [self.slideView reloadData];
    if (_imagesArray.count > 1) {
        self.slideView.loopSlide = YES;
        _nst_Timer = [NSTimer scheduledTimerWithTimeInterval: 2 target:self selector:@selector(onNext:) userInfo:nil repeats:YES];
    } else {
        self.slideView.loopSlide = NO;
    }
    return _imagesArray;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.slideView.delegate = self;
    self.slideView.dataSource = self;
    [self.slideView setPageControlHidden:YES
                                animated:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    if ([gestureRecognizer.view isKindOfClass:[UITableView class]]) {
        return YES;
    } else {
        return NO;
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    //your custom initialization code
    
    return self;
}

+ (NSString *)reuseIdentifier {
    return @"PagerCellCustom";
}

//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    self.pageWidthSlider.maximumValue = self.view.bounds.size.width;
//}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - RSlideView Datasource

- (NSInteger)RSlideViewNumberOfPages
{
    return [_imagesArray count] ;
}

- (UIView*)RSlideView:(RSlideView *)slideView
   viewForPageAtIndex:(NSInteger)index
{
    UIImageView *image = (UIImageView*)[_slideView dequeueReusableView];
    image = _imagesArray[index];
    return image;
}

- (NSString*)RSlideView:(RSlideView *)slideView titleForPageAtIndex:(NSInteger)index
{
    self.numberImage.text = [NSString stringWithFormat:@"%ld / %lu", (long)index, (unsigned long)_imagesArray.count];
    self.nameImageLabel.text = [NSString stringWithFormat:@"%ld.jpg",(long)index];
    return [NSString stringWithFormat:@"Title for %ld",index];
}

#pragma mark - RSlideView Delegate

- (void)RSlideView:(RSlideView *)_slideView tapOnPageAtIndex:(NSInteger)index
//show popup[ herre
{
    if (self.didTapImageBlock){
        self.didTapImageBlock(index);
    }
}

- (IBAction)onPrev:(id)sender
{
    [self.slideView previousPage];
}

- (IBAction)onNext:(id)sender
{
    [self.slideView nextPage];
}

- (IBAction)onPageWidth:(UISlider*)slider
{
    CGSize size = self.slideView.pageSize;
    size.width = slider.value;
    self.slideView.pageSize = size;
}

- (IBAction)onPageHeight:(UISlider*)slider
{
    CGSize size = self.slideView.pageSize;
    size.height = slider.value;
    self.slideView.pageSize = size;
}

- (IBAction)onPageMargin:(UISlider*)slider
{
    self.slideView.pageMargin = slider.value;
}

- (IBAction)onLoopscroll:(UISwitch*)sender
{
    self.slideView.loopSlide = sender.on;
}

- (IBAction)onContinuousscroll:(UISwitch*)sender
{
    self.slideView.continuousScroll = sender.on;
}

- (IBAction)onTitleAlignment:(UISwitch*)sender
{
    [self.slideView setPageTitleAlignment:sender.on ? RPageControllTitleAlignRight:RPageControllTitleAlignLeft];
}


@end
