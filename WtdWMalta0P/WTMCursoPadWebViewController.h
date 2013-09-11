//
//  WTMCursoPadWebViewController.h
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WTMCursoPadModelo.h"

@interface WTMCursoPadWebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) WTMCursoPadModelo *modeloCursoWeb;
@property (weak, nonatomic) IBOutlet UIWebView *browserCurso;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *visorActividadCurso;

-(id) initWithModelo: (WTMCursoPadModelo *) aModeloCursoWeb;

@end
