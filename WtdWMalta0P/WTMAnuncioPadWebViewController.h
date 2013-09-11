//
//  WTMAnuncioPadWebViewController.h
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTMAnuncioPadTablonModelo.h"

@interface WTMAnuncioPadWebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) WTMAnuncioPadModelo *modeloAnuncioWeb;
@property (weak, nonatomic) IBOutlet UIWebView *browserAnuncio;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *visorActividadAnuncio;

-(id) initWithModelo: (WTMAnuncioPadModelo *) aModeloAnuncioWeb;

@end
