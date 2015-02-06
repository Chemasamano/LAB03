//
//  ViewController.m
//  Lab03
//
//  Created by Chemamac on 2/5/15.
//  Copyright (c) 2015 Chemamac. All rights reserved.
//

#import "ViewController.h"
@import CoreData;

@interface ViewController ()

@end

@implementation ViewController
@synthesize Tnombre;
@synthesize Tsexo;
@synthesize Tedad;
@synthesize Tstatus;
@synthesize Temail;
@synthesize Tlink;
@synthesize contacto;

- (IBAction)guardar:(id)sender {
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (contacto) {
        [contacto setValue:Tnombre.text forKey:@"nombre"];
        [contacto setValue:Tsexo.text forKey:@"sexo"];
        [contacto setValue:Tedad.text forKey:@"edad"];
        [contacto setValue:Tstatus.text forKey:@"estatus"];
        [contacto setValue:Temail.text forKey:@"correo"];
        [contacto setValue:Tlink.text forKey:@"link"];
    } else {
    
        NSManagedObject *newcontacto = [NSEntityDescription insertNewObjectForEntityForName:@"Contactos" inManagedObjectContext:context];
        [newcontacto setValue:Tnombre.text forKey:@"nombre"];
        [newcontacto setValue:Tsexo.text forKey:@"sexo"];
        [newcontacto setValue:Tedad.text forKey:@"edad"];
        [newcontacto setValue:Tstatus.text forKey:@"estatus"];
        [newcontacto setValue:Temail.text forKey:@"correo"];
        [newcontacto setValue:Tlink.text forKey:@"link"];
        
    }
    
    

    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Error al guardar %@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancelar:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSManagedObjectContext *) managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (contacto)
    {
        [Tnombre setText:[contacto valueForKey:@"nombre"]];
        [Tsexo setText:[contacto valueForKey:@"sexo"]];
        [Tedad setText:[contacto valueForKey:@"edad"]];
        [Tstatus setText:[contacto valueForKey:@"estatus"]];
        [Temail setText:[contacto valueForKey:@"correo"]];
        [Tlink setText:[contacto valueForKey:@"link"]];
    }
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
