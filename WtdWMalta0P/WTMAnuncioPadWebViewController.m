//
//  WTMAnuncioPadWebViewController.m
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import "WTMAnuncioPadWebViewController.h"
#import "WTMAnuncioPadTablonTableViewController.h"

@implementation WTMAnuncioPadWebViewController

-(id) initWithModelo: (WTMAnuncioPadModelo *) aModeloAnuncioWeb {
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _modeloAnuncioWeb = aModeloAnuncioWeb;
        
        self.title = @"What to do Malta";
    }
    return  self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self displayURL: self.modeloAnuncioWeb.url];
    
    // Alta en Notificación
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self
               selector:@selector(cursoDidChange:)
                   name:NEW_ANUNCIO_NOTIFICACION
                 object:nil];
}

-(void) cursoDidChange: (NSNotification *) notificacion {
    
    NSDictionary *dicci = [notificacion userInfo];
    WTMAnuncioPadModelo *newAnuncio = [dicci objectForKey:ANUNCIO_KEY];
    
    // Actualizar el modelo
    self.modeloAnuncioWeb = newAnuncio;
    [self displayURL:self.modeloAnuncioWeb.url];
}


-(void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // Baja en Notificación
    [[NSNotificationCenter defaultCenter] removeObserver:nil];
    
}

#pragma  mark - UIWebViewDelegate

-(void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.visorActividadAnuncio stopAnimating];
    [self.visorActividadAnuncio setHidden:YES];
}

#pragma  mark - Utilidades

-(void) displayURL: (NSURL *) aURL {
    self.browserAnuncio.delegate = self;
    self.visorActividadAnuncio.hidden = NO;
    [self.visorActividadAnuncio startAnimating];
    [self.browserAnuncio loadRequest: [NSURLRequest requestWithURL:aURL]];
}


@end
