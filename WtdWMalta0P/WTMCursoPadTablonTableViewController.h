//
//  WTMCursoPadTablonTableViewController.h
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTMCursoPadTablonModelo.h"

#define SECCION_IDIOMAS 0
#define SECCION_BUCEO 1
#define SECCION_COCINA 2

#define NEW_CURSO_NOTIFICACION @"nuevoCurso"
#define  CURSO_KEY @"curso"

// Declaración adelantada para que no dé error

@class WTMCursoPadTablonTableViewController;

@protocol CursoPadTablonTableViewControllerDelegate <NSObject>

-(void) cursoPadTablonTableViewController: (WTMCursoPadTablonTableViewController *) tablonCursoPadVC
                     didSelecteCurso:(WTMCursoPadModelo *) aCursoTablon;

@end

@interface WTMCursoPadTablonTableViewController : UITableViewController

@property (strong, nonatomic) WTMCursoPadTablonModelo *modeloCursoTablon;
@property (nonatomic, weak) id <CursoPadTablonTableViewControllerDelegate> delegate;

-(id) initWithModelo: (WTMCursoPadTablonModelo *) aModeloCursoTablon
               style:(UITableViewStyle) aStyle;


@end
