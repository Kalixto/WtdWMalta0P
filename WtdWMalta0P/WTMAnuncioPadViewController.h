//
//  WTMAnuncioPadViewController.h
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTMAnuncioPadTablonModelo.h"
#import "WTMAnuncioPadTablonTableViewController.h"

@interface WTMAnuncioPadViewController : UIViewController <UISplitViewControllerDelegate>

// Propiedades
@property (strong, nonatomic) WTMAnuncioPadModelo *modeloAnuncio;

@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UIImageView *fotoView;
@property (weak, nonatomic) IBOutlet UILabel *notasLabel;
@property (weak, nonatomic) IBOutlet UIButton *botonUrl;

-(id) initWithModelo: (WTMAnuncioPadModelo *) aModeloAnuncio;

-(IBAction) displayUrl:(id)sender;

@end
