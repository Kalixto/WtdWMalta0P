//
//  WTMCursoPadWebViewController.m
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import "WTMCursoPadWebViewController.h"
#import "WTMCursoPadTablonTableViewController.h"


@implementation WTMCursoPadWebViewController

-(id) initWithModelo:(WTMCursoPadModelo *)aModeloCursoWeb {
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _modeloCursoWeb = aModeloCursoWeb;
        self.title = @"What to do Malta";
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self displayURL: self.modeloCursoWeb.url];
    
    // Alta en Notificación
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self
               selector:@selector(cursoDidChange:)
                   name:NEW_CURSO_NOTIFICACION
                 object:nil];
    
}

-(void) cursoDidChange: (NSNotification *) notificacion {
    
    NSDictionary *dicci = [notificacion userInfo];
    WTMCursoPadModelo *newCurso = [dicci objectForKey:CURSO_KEY];
    
    // Actualizar el modelo
    self.modeloCursoWeb = newCurso;
    [self displayURL:self.modeloCursoWeb.url];
}


-(void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // Baja en Notificación
    [[NSNotificationCenter defaultCenter] removeObserver:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - UIWebViewDelegate

-(void) webViewDidFinishLoad:(UIWebView *)webView {
    
    [self.visorActividadCurso stopAnimating];
    [self.visorActividadCurso setHidden:YES];
    
}

#pragma mark - Utilidades

-(void) displayURL: (NSURL *) aURL {
    
    
    self.browserCurso.delegate = self;
    
    self.visorActividadCurso.hidden = NO;
    [self.visorActividadCurso startAnimating];
    [self.browserCurso loadRequest:[NSURLRequest requestWithURL:aURL]];
    
}


@end
