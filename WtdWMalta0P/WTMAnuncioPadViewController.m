//
//  WTMAnuncioPadViewController.m
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import "WTMAnuncioPadViewController.h"
#import "WTMAnuncioPadWebViewController.h"

@interface WTMAnuncioPadViewController ()

@end

@implementation WTMAnuncioPadViewController

-(id) initWithModelo:(WTMAnuncioPadModelo *)aModeloAnuncio {
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _modeloAnuncio = aModeloAnuncio;
        self.title = aModeloAnuncio.nombre;
    }
    return self;
}


-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self sincronizarVistaYModelo];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.5 alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Acciones

- (IBAction)displayUrl:(id)sender {
    
    // Crear un WebVC
    WTMAnuncioPadWebViewController *webAnuncioVC = [[WTMAnuncioPadWebViewController alloc] initWithModelo:self.modeloAnuncio];
    
    // Hacemos un Push
    [self.navigationController pushViewController:webAnuncioVC
                                         animated:YES];
}


#pragma mark - Utilidades

-(void) sincronizarVistaYModelo {
    self.notasLabel.text = self.modeloAnuncio.notas;
    self.logoView.image = self.modeloAnuncio.logo;
    self.fotoView.image = self.modeloAnuncio.foto;
    
    [self.notasLabel setNumberOfLines:0];
}

#pragma mark - UISplitViewControllerDelegate

// Cuando se oculta el controlador y se coloca el botón
- (void) splitViewController:(UISplitViewController *)svc
      willHideViewController:(UIViewController *)aViewController
           withBarButtonItem:(UIBarButtonItem *)barButtonItem
        forPopoverController:(UIPopoverController *)pc {
    
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
}

// Cuando aparece el controlador y se oculta el botón
- (void) splitViewController:(UISplitViewController *)svc
      willShowViewController:(UIViewController *)aViewController
   invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
    self.navigationItem.rightBarButtonItem = nil;
    
}

#pragma mark TablonPadTableViewControllerDelegate

-(void) anuncioPadTablonTableViewController: (WTMAnuncioPadTablonTableViewController *) tablonAnuncioPadVC
                          didSelecteAnuncio:(WTMAnuncioPadModelo *) aAnuncio{
    
    self.modeloAnuncio = aAnuncio;
    self.title = aAnuncio.nombre;
    [self sincronizarVistaYModelo];
       
}


@end
