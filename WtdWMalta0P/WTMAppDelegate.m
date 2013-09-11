//
//  WTMAppDelegate.m
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import "WTMAppDelegate.h"
#import "WTMCursoPadModelo.h"
#import "WTMCursoPadViewController.h"
#import "WTMCursoPadWebViewController.h"
#import "WTMCursoPadTablonModelo.h"
#import "WTMCursoPadTablonTableViewController.h"

#import "WTMAnuncioPadModelo.h"
#import "WTMAnuncioPadViewController.h"
#import "WTMAnuncioPadWebViewController.h"
#import "WTMAnuncioPadTablonModelo.h"
#import "WTMAnuncioPadTablonTableViewController.h"

@implementation WTMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    // Creamos los Modelos
    
    WTMCursoPadTablonModelo *tablonCursos = [[WTMCursoPadTablonModelo alloc] init];
    WTMAnuncioPadTablonModelo *tablonAnuncios = [[WTMAnuncioPadTablonModelo alloc] init];
    
    // Creamos los Controladores
    
    WTMCursoPadTablonTableViewController *tablonCursosVC = [[WTMCursoPadTablonTableViewController alloc] initWithModelo:tablonCursos
                                                                                                  style:UITableViewStyleGrouped];
    
    WTMCursoPadViewController *cursoVC = [[WTMCursoPadViewController alloc] initWithModelo:[tablonCursos idiomasAtIndex:0]];
    
    WTMAnuncioPadTablonTableViewController *tablonAnunciosVC = [[WTMAnuncioPadTablonTableViewController alloc] initWithModelo:tablonAnuncios
                                                                                                                       style:UITableViewStyleGrouped];
    
    WTMAnuncioPadViewController *anuncioVC = [[WTMAnuncioPadViewController alloc] initWithModelo:[tablonAnuncios eventosAtIndex:0]];
    
    // Creamos los Navigations
    
    UINavigationController *naviCursoTablon = [[UINavigationController alloc] initWithRootViewController:tablonCursosVC];
    UINavigationController *naviCurso = [[UINavigationController alloc] initWithRootViewController:cursoVC];
    
    UINavigationController *naviAnuncioTablon = [[UINavigationController alloc] initWithRootViewController:tablonAnunciosVC];
    UINavigationController *naviAnuncio = [[UINavigationController alloc] initWithRootViewController:anuncioVC];
    
    // Creamos el Combinador: SplitView
    
    UISplitViewController *splitCursosVC = [[UISplitViewController alloc] init];
    splitCursosVC.viewControllers = @[naviCursoTablon, naviCurso];
    splitCursosVC.tabBarItem.image = [UIImage imageNamed:@"140-gradhat"];
    splitCursosVC.tabBarItem.title = @"Cursos";
    
    UISplitViewController *splitAnunciosVC = [[UISplitViewController alloc] init];
    splitAnunciosVC.viewControllers = @[naviAnuncioTablon, naviAnuncio];
    splitAnunciosVC.tabBarItem.image = [UIImage imageNamed:@"60-signpost"];
    splitAnunciosVC.tabBarItem.title = @"Anuncios";
    
    // Asignamos Delegados
    
    splitCursosVC.delegate = cursoVC;
    tablonCursosVC.delegate = cursoVC;
    
    splitAnunciosVC.delegate = anuncioVC;
    tablonAnunciosVC.delegate = anuncioVC;
    
    // Creamos el Combinador
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    
    // Le cargamos los Split
    
    tabVC.viewControllers = @[splitAnunciosVC, splitCursosVC];
    
    // Lo asignamos como controlador raiz
    
    self.window.rootViewController = tabVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
