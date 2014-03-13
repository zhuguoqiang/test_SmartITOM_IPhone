//
//  SBCEViewController.m
//  SimpleBarChartExample
//
//  Created by Mohammed Islam on 1/17/14.
//  Copyright (c) 2014 KSI Technology. All rights reserved.
//

#import "SBCEViewController.h"
#import "NSMutableArray+TTMutableArray.h"


@interface SBCEViewController ()

@end

@implementation SBCEViewController

- (void)loadView
{
	[super loadView];

	_values							= @[@30, @45, @44, @60, @95, @2, @8, @9];
	_barColors						= @[[UIColor blueColor], [UIColor redColor], [UIColor blackColor], [UIColor orangeColor], [UIColor purpleColor], [UIColor greenColor]];
	_currentBarColor				= 0;

	CGRect chartFrame				= CGRectMake(0.0,
												 0.0,
												 700,
												 700.0);
	_chart							= [[SimpleBarChart alloc] initWithFrame:chartFrame];
	_chart.center					= CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
	_chart.delegate					= self;
	_chart.dataSource				= self;
	_chart.barShadowOffset			= CGSizeMake(2.0, 1.0);
	_chart.animationDuration		= 1.0;
	_chart.barShadowColor			= [UIColor grayColor];
	_chart.barShadowAlpha			= 0.5;
	_chart.barShadowRadius			= 1.0;
	_chart.barWidth					= 18.0;
	_chart.xLabelType				= SimpleBarChartXLabelTypeVerticle;
	_chart.incrementValue			= 10;
	_chart.barTextType				= SimpleBarChartBarTextTypeTop;
	_chart.barTextColor				= [UIColor whiteColor];
	_chart.gridColor				= [UIColor grayColor];

	[self.view addSubview:_chart];

	UIButton *changeButton			= [UIButton buttonWithType:UIButtonTypeRoundedRect];
	changeButton.frame				= CGRectMake(0.0,
												 _chart.frame.origin.y + _chart.frame.size.height + 20.0,
												 100.0,
												 44.0);
	changeButton.center				= CGPointMake(self.view.frame.size.width / 2.0, changeButton.center.y);
	[changeButton setTitle:@"Change" forState:UIControlStateNormal];
	[changeButton addTarget:self action:@selector(changeClicked) forControlEvents:UIControlEventTouchDown];

	[self.view addSubview:changeButton];
}

- (void)changeClicked
{
	NSMutableArray *valuesCopy = _values.mutableCopy;
	[valuesCopy shuffle];

	_values = valuesCopy;

	if (_chart.xLabelType == SimpleBarChartXLabelTypeVerticle)
		_chart.xLabelType = SimpleBarChartXLabelTypeHorizontal;
	else
		_chart.xLabelType = SimpleBarChartXLabelTypeVerticle;

	_currentBarColor = ++_currentBarColor % _barColors.count;

	[_chart reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];

	[_chart reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark SimpleBarChartDataSource

- (NSUInteger)numberOfBarsInBarChart:(SimpleBarChart *)barChart
{
	return _values.count;
}

- (CGFloat)barChart:(SimpleBarChart *)barChart valueForBarAtIndex:(NSUInteger)index
{
	return [[_values objectAtIndex:index] floatValue];
}

- (NSString *)barChart:(SimpleBarChart *)barChart textForBarAtIndex:(NSUInteger)index
{
	return [[_values objectAtIndex:index] stringValue];
}

- (NSString *)barChart:(SimpleBarChart *)barChart xLabelForBarAtIndex:(NSUInteger)index
{
	return [[_values objectAtIndex:index] stringValue];
}

- (UIColor *)barChart:(SimpleBarChart *)barChart colorForBarAtIndex:(NSUInteger)index
{
	return [_barColors objectAtIndex:_currentBarColor];
}


@end
