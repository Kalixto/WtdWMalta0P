//
//  WTMAnuncioPadTablonTableViewController.h
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTMAnuncioPadTablonModelo.h"

#define SECCION_EVENTOS 0
#define SECCION_TURISMO 1
#define SECCION_RESTAURACION 2

#define NEW_ANUNCIO_NOTIFICACION @"nuevoAnuncio"
#define ANUNCIO_KEY @"anuncio"

// Declaración adelantada para que no dé error

@class WTMAnuncioPadTablonTableViewController;

@protocol AnuncioPadTablonTableViewControllerDelegate <NSObject>

-(void) anuncioPadTablonTableViewController: (WTMAnuncioPadTablonTableViewController *) tablonAnuncioPadVC
                          didSelecteAnuncio:(WTMAnuncioPadModelo *) aAnuncioTablon;

@end

@interface WTMAnuncioPadTablonTableViewController : UITableViewController

@property (nonatomic, strong) WTMAnuncioPadTablonModelo *modeloAnuncioTablon;
@property (nonatomic, weak) id <AnuncioPadTablonTableViewControllerDelegate> delegate;

-(id) initWithModelo: (WTMAnuncioPadTablonModelo *) aModeloAnuncioTablon
               style:(UITableViewStyle) aStyle;

@end
