//
//  ELineChart.m
//  EChartDemo
//
//  Created by 朱 建慧 on 13-12-25.
//  Copyright (c) 2013年 Scott Zhu. All rights reserved.
//
#import "EColor.h"
#import "ELineChart.h"

#define DIRECTION  -1
#define VIRTUAL_SCREEN_COUNT 5

@interface ELineChart()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic) CGFloat horizentalGap;
@property (nonatomic) NSInteger reloadCount;
@property (nonatomic) BOOL isInLastScreen;

@property (nonatomic ,strong) ELine *eLine;
@end

@implementation ELineChart
@synthesize dataSource = _dataSource;
@synthesize leftMostIndex = _leftMostIndex;
@synthesize rightMostIndex = _rightMostIndex;
@synthesize scrollView = _scrollView;
@synthesize horizentalGap = _horizentalGap;
@synthesize reloadCount = _reloadCount;
@synthesize isInLastScreen = _isInLastScreen;
@synthesize lineWidth = _lineWidth;
@synthesize lineColor = _lineColor;
@synthesize eLineIndexStartFromRight = _eLineIndexStartFromRight;

@synthesize eLine = _eLine;

- (id)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame lineWidth: 4 lineColor: EGreen];
    return self;
}

- (id)initWithFrame:(CGRect)frame
          lineWidth:(NSInteger)lineWidth
          lineColor:(UIColor *)lineColor
{
    
    self = [super initWithFrame:frame];
    if (self)
    {
        //self.clipsToBounds = YES;
        _lineWidth = lineWidth;
        _lineColor = lineColor;
        
        /** Setup Scroll View*/
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.minimumZoomScale = 0.5;
        _scrollView.maximumZoomScale = 2;
        _scrollView.showsHorizontalScrollIndicator = NO;
//        _scrollView.showsVerticalScrollIndicator = YES;
        [_scrollView setDelegate:self];
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame) * VIRTUAL_SCREEN_COUNT, CGRectGetHeight(self.frame));
        [self addSubview:_scrollView];
        

    }
    return self;
}



#pragma -mark- Setter and Getter
- (void)setDataSource:(id<ELineChartDataSource>)dataSource
{
    if (dataSource && _dataSource != dataSource)
    {
        _dataSource = dataSource;
        /** Check if every dataSource is implemented*/
        
        if (_eLineIndexStartFromRight)
        {
            _rightMostIndex = 0;
            _leftMostIndex = ([_dataSource numberOfPointsPresentedEveryTime:self] - 1) * VIRTUAL_SCREEN_COUNT;
        }
        else
        {
            _leftMostIndex = 0;
            _rightMostIndex = ([_dataSource numberOfPointsPresentedEveryTime:self] - 1) * VIRTUAL_SCREEN_COUNT;
        }
        
        _horizentalGap = _scrollView.contentSize.width / (([_dataSource numberOfPointsPresentedEveryTime:self] - 1) * VIRTUAL_SCREEN_COUNT);
        [self reloadContent];
    }
}



- (void)reloadContent
{
    _reloadCount ++;
    if (!_eLine)
    {
        _eLine = [[ELine alloc] initWithFrame:CGRectMake(0, 0, _scrollView.contentSize.width, CGRectGetHeight(_scrollView.bounds) / 2) lineColor:_lineColor lineWidth:_lineWidth];
        [_eLine setDataSource:self];
    }
    [_eLine reloadDataWithAnimation:(_reloadCount <= 1)];
    [_scrollView addSubview:_eLine];
    if (_reloadCount <= 1 && _eLineIndexStartFromRight)
    {
        [_scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.frame) * (VIRTUAL_SCREEN_COUNT - 1), _scrollView.contentOffset.y)];
    }
}





#pragma -mark- LineChart Control Methods


#pragma -mark- UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint currentOffset = [scrollView contentOffset];
    CGFloat contentWidth = [scrollView contentSize].width;
    CGFloat centerOffsetX = (contentWidth - [self bounds].size.width) / 2.0;
    //CGFloat distanceFromCenter = fabs(currentOffset.x - centerOffsetX);
    CGFloat distanceFromCenter = currentOffset.x - centerOffsetX;
    
    if (_eLineIndexStartFromRight)
    {
        if (distanceFromCenter > centerOffsetX && _rightMostIndex > 0)
        {
            //NSLog(@"Scroll.ContentSize %@", NSStringFromCGSize(_scrollView.contentSize));
            //reset content layer
            _rightMostIndex -= ([_dataSource numberOfPointsPresentedEveryTime:self] - 1) * 2;
            _leftMostIndex = _rightMostIndex + ([_dataSource numberOfPointsPresentedEveryTime:self] - 1) * VIRTUAL_SCREEN_COUNT;
            _rightMostIndex = _rightMostIndex < 0 ? 0 :_rightMostIndex;
            
            if (_scrollView.contentSize.width < CGRectGetWidth(_scrollView.bounds) * VIRTUAL_SCREEN_COUNT)
            {
                /** contentSize.width is changed before, so change it back, So that you can set the right contentOffset*/
                _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame) * VIRTUAL_SCREEN_COUNT, CGRectGetHeight(self.frame));
                _eLine.frame = CGRectMake(CGRectGetMinX(_eLine.frame), CGRectGetMinY(_eLine.frame), _scrollView.contentSize.width, CGRectGetHeight(_eLine.frame));
                currentOffset = [scrollView contentOffset];
                contentWidth = [scrollView contentSize].width;
                centerOffsetX = (contentWidth - [self bounds].size.width) / 2.0;
            }
            scrollView.contentOffset = CGPointMake(centerOffsetX, currentOffset.y);
            [self reloadContent];
        }
        
        if (distanceFromCenter < - 1 * centerOffsetX && _leftMostIndex < ([_dataSource numberOfPointsInELineChart:self] - 1))
        {
            //NSLog(@"Scroll.ContentSize %@", NSStringFromCGSize(_scrollView.contentSize));
            //reset content layer
            scrollView.contentOffset = CGPointMake(centerOffsetX, currentOffset.y);
            NSInteger oldLeftMost = _leftMostIndex;
            _leftMostIndex += ([_dataSource numberOfPointsPresentedEveryTime:self] - 1) * 2;
            _rightMostIndex += ([_dataSource numberOfPointsPresentedEveryTime:self] - 1) * 2;
            if (_leftMostIndex > ([_dataSource numberOfPointsInELineChart:self] - 1))
            {
                _leftMostIndex = [_dataSource numberOfPointsInELineChart:self] - 1;
                /** Reach the end of data, decrese the contentSize.width to fit*/
                _scrollView.contentSize = CGSizeMake(_horizentalGap * (_leftMostIndex - _rightMostIndex), CGRectGetHeight(_scrollView.bounds));
                _eLine.frame = CGRectMake(CGRectGetMinX(_eLine.frame), CGRectGetMinY(_eLine.frame), _scrollView.contentSize.width, CGRectGetHeight(_eLine.frame));
                _isInLastScreen = YES;
                scrollView.contentOffset = CGPointMake(_horizentalGap * (_leftMostIndex - oldLeftMost), currentOffset.y);
            }
            
            [self reloadContent];
        }
    }
    else
    {
        if (distanceFromCenter > centerOffsetX && _rightMostIndex < ([_dataSource numberOfPointsInELineChart:self] - 1))
        {
            scrollView.contentOffset = CGPointMake(centerOffsetX, currentOffset.y);
            //reset content layer
            _leftMostIndex += ([_dataSource numberOfPointsPresentedEveryTime:self] - 1) * 2;
            _rightMostIndex += ([_dataSource numberOfPointsPresentedEveryTime:self] - 1) * 2;
            if (_rightMostIndex > ([_dataSource numberOfPointsInELineChart:self] - 1))
            {
                _rightMostIndex = [_dataSource numberOfPointsInELineChart:self] - 1;
                /** Reach the end of data, decrese the contentSize.width to fit*/
                _scrollView.contentSize = CGSizeMake(_horizentalGap * (_rightMostIndex - _leftMostIndex), CGRectGetHeight(_scrollView.bounds));
                _eLine.frame = CGRectMake(CGRectGetMinX(_eLine.frame), CGRectGetMinY(_eLine.frame), _scrollView.contentSize.width, CGRectGetHeight(_eLine.frame));
                _isInLastScreen = YES;
            }
            
            [self reloadContent];
            
        }
        
        if (distanceFromCenter < - 1 * centerOffsetX && _leftMostIndex > 0)
        {
            //NSLog(@"Scroll.ContentSize %@", NSStringFromCGSize(_scrollView.contentSize));
            if (_scrollView.contentSize.width < CGRectGetWidth(_scrollView.bounds) * VIRTUAL_SCREEN_COUNT)
            {
                /** contentSize.width is changed before, so change it back, So that you can set the right contentOffset*/
                _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame) * VIRTUAL_SCREEN_COUNT, CGRectGetHeight(self.frame));
                _eLine.frame = CGRectMake(CGRectGetMinX(_eLine.frame), CGRectGetMinY(_eLine.frame), _scrollView.contentSize.width, CGRectGetHeight(_eLine.frame));
                currentOffset = [scrollView contentOffset];
                contentWidth = [scrollView contentSize].width;
                centerOffsetX = (contentWidth - [self bounds].size.width) / 2.0;
            }
            
            scrollView.contentOffset = CGPointMake(centerOffsetX, currentOffset.y);
            
            //reset content layer
            _leftMostIndex -= ([_dataSource numberOfPointsPresentedEveryTime:self] - 1) * 2;
            _rightMostIndex = _leftMostIndex + ([_dataSource numberOfPointsPresentedEveryTime:self] - 1) * VIRTUAL_SCREEN_COUNT;
            _leftMostIndex = _leftMostIndex < 0 ? 0 :_leftMostIndex;
            [self reloadContent];
        }
    }
    
    
}

#pragma -mark- ELine DataSource Delegate
- (ELineChartDataModel *)eLine:(ELine *)eLine valueForIndex:(NSInteger)index
{
    if (_eLineIndexStartFromRight)
    {
        return [_dataSource eLineChart:self valueForIndex: (_leftMostIndex - index)];
    }
    else
    {
        return [_dataSource eLineChart:self valueForIndex: (_leftMostIndex + index)];
    }
    
}

- (NSInteger)numberOfPointsInELine:(ELine *)eLine
{
    if (_eLineIndexStartFromRight)
    {
        return _leftMostIndex - _rightMostIndex + 1;
    }
    else
    {
        return _rightMostIndex - _leftMostIndex + 1;
    }
    
}

- (ELineChartDataModel *)highestValueInELine:(ELine *)eLine
{
    return [_dataSource highestValueELineChart:self];
}


@end
