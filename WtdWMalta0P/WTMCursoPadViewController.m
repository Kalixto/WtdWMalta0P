//
//  WTMCursoPadViewController.m
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import "WTMCursoPadViewController.h"
#import "WTMCursoPadWebViewController.h"


@implementation WTMCursoPadViewController

-(id) initWithModelo: (WTMCursoPadModelo *) aModeloCurso{
    
    // decimos que el nib/xib sea el por defecto
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _modeloCurso = aModeloCurso;
        
        self.title = aModeloCurso.empresa;
    }
    return self;
}

// Sincronizamos Modelo y Vista
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self sincronizarVistaYModelo];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.1
                                                                        green:0.1
                                                                         blue:0.5
                                                                        alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - Acciones

- (IBAction) displayUrl:(id)sender{
    
    // Crear un webVC
    WTMCursoPadWebViewController *webVC = [[WTMCursoPadWebViewController alloc] initWithModelo:self.modeloCurso];
    
    // hacemos un Push
    [self.navigationController pushViewController:webVC
                                         animated:YES];
}

#pragma  mark - Utilidades

-(void) sincronizarVistaYModelo {
    
    self.notasLabel.text = self.modeloCurso.notas;
    self.logoView.image = self.modeloCurso.logo;
    self.empresaLabel.text = self.modeloCurso.empresa;
    self.ciudadLabel.text = self.modeloCurso.ciudad;
    self.tituloView.image = self.modeloCurso.titulo;
    
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

-(void) cursoPadTablonTableViewController: (WTMCursoPadTablonTableViewController *) tablonPadVC
                     didSelecteCurso:(WTMCursoPadModelo *) aCurso{
    
    self.modeloCurso = aCurso;
    self.title = aCurso.empresa;
    [self sincronizarVistaYModelo];
    
    
}

@end
