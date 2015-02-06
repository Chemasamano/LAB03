//
//  ViewController.h
//  Lab03
//
//  Created by Chemamac on 2/5/15.
//  Copyright (c) 2015 Chemamac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *Tnombre;
@property (strong, nonatomic) IBOutlet UITextField *Tsexo;
@property (strong, nonatomic) IBOutlet UITextField *Tedad;
@property (strong, nonatomic) IBOutlet UITextField *Tstatus;
@property (strong, nonatomic) IBOutlet UITextField *Temail;
@property (strong, nonatomic) IBOutlet UITextField *Tlink;

@property (strong) NSManagedObjectContext *contacto;

@end
