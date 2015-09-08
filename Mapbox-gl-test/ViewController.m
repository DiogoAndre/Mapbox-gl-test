//
//  ViewController.m
//  Mapbox-gl-test
//
//  Created by Diogo Andre Assumpcao on 9/8/15.
//  Copyright (c) 2015 Diogo Andre Assumpcao. All rights reserved.
//
#import "Mapbox.h"
#import <CoreLocation/CoreLocation.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MGLAccountManager setAccessToken:@"pk.eyJ1IjoianVzdGluIiwiYSI6IlpDbUJLSUEifQ.4mG8vhelFMju6HpIY-Hi5A"];
    self.mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds];
    
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // Set the map's center coordinates and zoom level
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(40.7326808, -73.9843407)
                            zoomLevel:12
                             animated:NO];
    
    [self.view addSubview:self.mapView];
    
    // Set the delegate property of our map view to self after instantiating it.
    self.mapView.delegate = self;
    
    // annotations must be added after `viewDidLoad`, such as in `viewDidAppear`
    // https://github.com/mapbox/mapbox-gl-native/pull/1874

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Declare the marker `hello` and set its coordinates, title, and subtitle
    MGLPointAnnotation *hello = [[MGLPointAnnotation alloc] init];
    hello.coordinate = CLLocationCoordinate2DMake(40.7326808, -73.9843407);
    hello.title = @"Hello world!";
    hello.subtitle = @"Welcome to my marker";
    
    // Add marker `hello` to the map
    [self.mapView addAnnotation:hello];
    
    CLLocationCoordinate2D coordinates[] = {
        {38.790339, -77.040583},
        {38.893219, -77.172304},
        {38.995946, -77.040947},
        {38.892829, -76.909229},
    };
    
    
    [self.mapView setVisibleCoordinates:coordinates
                                    count:sizeof(coordinates) / sizeof(coordinates[0])
                              edgePadding:UIEdgeInsetsZero
                                 animated:NO];
    
}

// Use the default marker; see our custom marker example for more information
- (MGLAnnotationImage *)mapView:(MGLMapView *)mapView imageForAnnotation:(id <MGLAnnotation>)annotation {
    return nil;
}

// Allow markers callouts to show when tapped
- (BOOL)mapView:(MGLMapView *)mapView annotationCanShowCallout:(id <MGLAnnotation>)annotation {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
