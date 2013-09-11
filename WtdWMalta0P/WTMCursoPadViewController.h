//
//  WTMCursoPadViewController.h
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTMCursoPadModelo.h"
#import "WTMCursoPadTablonTableViewController.h"

@interface WTMCursoPadViewController : UIViewController <UISplitViewControllerDelegate>


// Propiedades

@property (strong, nonatomic) WTMCursoPadModelo *modeloCurso;

@property (weak, nonatomic) IBOutlet UIImageView *tituloView;
@property (weak, nonatomic) IBOutlet UILabel *empresaLabel;
@property (weak, nonatomic) IBOutlet UILabel *ciudadLabel;
@property (weak, nonatomic) IBOutlet UILabel *notasLabel;
@property (weak, nonatomic) IBOutlet UIImageView *logoView;

-(id) initWithModelo: (WTMCursoPadModelo *) aModeloCurso;

-(IBAction)displayUrl:(id)sender;

@end
