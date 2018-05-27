//
//  ViewController.m
//  NSURLSession
//
//  Created by Victor Macintosh on 27/05/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIImageView *imageView;
@property (weak, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) UIButton *startButton;

- (void)setupViews;
- (void)startLoading;
- (void)showErrorAlert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupViews];
}

- (void)setupViews {
    
    self.startButton = [[UIButton alloc] init];
    self.startButton.backgroundColor = UIColor.blueColor;
    [self.startButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14.0]];
    self.startButton.titleLabel.textColor = UIColor.whiteColor;
    [self.startButton setTitle:@"Load" forState:UIControlStateNormal];
    self.startButton.layer.cornerRadius = 6.0;
    [self.startButton addTarget:self action:@selector(startLoading) forControlEvents:UIControlEventTouchUpInside];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.backgroundColor = UIColor.lightGrayColor;
    self.imageView.layer.cornerRadius = 6.0;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.activityIndicator = [[UIActivityIndicatorView alloc] init];
    self.activityIndicator.hidesWhenStopped = YES;
    self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    self.activityIndicator.color = UIColor.greenColor;
    
    
    [self.view addSubview:self.imageView];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *leftImageViewConstraint = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                               attribute:NSLayoutAttributeLeft
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.view
                                                                               attribute:NSLayoutAttributeLeft
                                                                              multiplier:1.0
                                                                                constant:16.0];
    NSLayoutConstraint *topImageViewConstraint = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                              attribute:NSLayoutAttributeTop
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.view
                                                                              attribute:NSLayoutAttributeTop
                                                                             multiplier:1.0
                                                                               constant:40.0];
    NSLayoutConstraint *rightImageViewConstraint = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                                attribute:NSLayoutAttributeRight
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeRight
                                                                               multiplier:1.0
                                                                                 constant:-16.0];
    NSLayoutConstraint *heightImageViewConstraint = [NSLayoutConstraint constraintWithItem:self.imageView
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1.0
                                                                                  constant:200];
    [self.view addConstraints:@[leftImageViewConstraint,
                                topImageViewConstraint,
                                rightImageViewConstraint,
                                heightImageViewConstraint]];
    
    [self.view addSubview:self.startButton];
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *widthConstaintButton = [NSLayoutConstraint constraintWithItem:self.startButton
                                                                            attribute:NSLayoutAttributeWidth
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1.0
                                                                             constant:150.0];
    NSLayoutConstraint *heightConstraintButton = [NSLayoutConstraint constraintWithItem:self.startButton
                                                                              attribute:NSLayoutAttributeHeight
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:nil
                                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                                             multiplier:1.0
                                                                               constant:40.0];
    NSLayoutConstraint *centerXConstaintButton = [NSLayoutConstraint constraintWithItem:self.startButton
                                                                              attribute:NSLayoutAttributeCenterX
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.view
                                                                              attribute:NSLayoutAttributeCenterX
                                                                             multiplier:1.0
                                                                               constant:0.0];
    NSLayoutConstraint *topConstraintButton = [NSLayoutConstraint constraintWithItem:self.startButton
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.imageView
                                                                           attribute:NSLayoutAttributeBottom
                                                                          multiplier:1.0
                                                                            constant:20.0];
    [self.view addConstraints:@[widthConstaintButton, heightConstraintButton, centerXConstaintButton, topConstraintButton]];
    
    [self.view addSubview:self.activityIndicator];
    self.activityIndicator.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *rightConstraintIndicator = [NSLayoutConstraint constraintWithItem:self.activityIndicator
                                                                                attribute:NSLayoutAttributeRight
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.startButton
                                                                                attribute:NSLayoutAttributeLeft
                                                                               multiplier:1.0
                                                                                 constant:-20.0];
    NSLayoutConstraint *centerYConstraintIndicator = [NSLayoutConstraint constraintWithItem:self.activityIndicator
                                                                                  attribute:NSLayoutAttributeCenterY
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.startButton
                                                                                  attribute:NSLayoutAttributeCenterY
                                                                                 multiplier:1.0
                                                                                   constant:0.0];
    NSLayoutConstraint *widthIndicatorConstraint = [NSLayoutConstraint constraintWithItem:self.activityIndicator
                                                                                attribute:NSLayoutAttributeWidth
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:nil
                                                                                attribute:NSLayoutAttributeNotAnAttribute
                                                                               multiplier:1.0
                                                                                 constant:30.0];
    NSLayoutConstraint *heightIndicatorConstraint = [NSLayoutConstraint constraintWithItem:self.activityIndicator
                                                                                 attribute:NSLayoutAttributeHeight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:nil
                                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier:1.0
                                                                                  constant:30.0];
    [self.view addConstraints:@[rightConstraintIndicator, centerYConstraintIndicator, widthIndicatorConstraint, heightIndicatorConstraint]];
    
    //[self.startButton release];
    //[self.activityIndicator release];
    //[self.imageView release];
}

- (void)startLoading {
    NSURL *url = [NSURL URLWithString:@"https://qz.com/wp-content/uploads/2017/04/apple-store-aapl-angela-ahrents-hang-out.jpg"];
    [self.activityIndicator startAnimating];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    //NSURLSessionDataTask
    
//    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
//                                            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (error == nil) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.activityIndicator stopAnimating];
//                self.imageView.image = [UIImage imageWithData:data];
//            });
//        } else {
//            NSLog(@"Error: %@", [error localizedDescription]);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.activityIndicator stopAnimating];
//                [self showErrorAlert];
//            });
//        }
//    }];
//    [dataTask resume];
    
    //NSURLSessionDownloadTask
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSData *data = [NSData dataWithContentsOfURL:location];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.activityIndicator stopAnimating];
                self.imageView.image = [UIImage imageWithData:data];
            });
        } else {
            NSLog(@"Error: %@", [error localizedDescription]);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.activityIndicator stopAnimating];
                [self showErrorAlert];
            });
        }
    }];
    [downloadTask resume];
}

- (void)showErrorAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:@"Something went wrong"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * _Nonnull action) {
        //something here
    }];
    
    [alert addAction:action];
    [self presentViewController:alert
                       animated:YES
                     completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
