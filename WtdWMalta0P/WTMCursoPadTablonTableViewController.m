//
//  WTMCursoPadTablonTableViewController.m
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import "WTMCursoPadTablonTableViewController.h"
#import "WTMCursoPadViewController.h"

@implementation WTMCursoPadTablonTableViewController

-(id) initWithModelo:(WTMCursoPadTablonModelo *)aModeloCursoTablon style:(UITableViewStyle)aStyle {
    if (self = [super initWithStyle:aStyle]) {
        _modeloCursoTablon = aModeloCursoTablon;
        self.title = @"Cursos WtdM";

    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.1
                                                                        green:0.1
                                                                         blue:0.5 alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == SECCION_IDIOMAS) {
        return @"English Schools";
    } else if (section == SECCION_BUCEO) {
        return @"Diving Centre";
    } else {
        return @"Cooking Classes";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    if (section == SECCION_IDIOMAS) {
        return self.modeloCursoTablon.idiomasCount;
    } else if (section == SECCION_BUCEO) {
        return self.modeloCursoTablon.buceoCount;
    } else {
        return self.modeloCursoTablon.cocinaCount;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    // No utilizamos este por que es para celdas personalizadas y en este caso no
    // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == Nil) {
        // No tiene y tenemos que crearla a mano
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    
    // Averiguar de qué modelo (curso) nos están hablando
    WTMCursoPadModelo *curso = nil;
    if (indexPath.section == SECCION_IDIOMAS) {
        curso = [self.modeloCursoTablon idiomasAtIndex:indexPath.row];
    } else if (indexPath.section == SECCION_BUCEO) {
        curso = [self.modeloCursoTablon buceoAtIndex:indexPath.row];
    } else {
        curso = [self.modeloCursoTablon cocinaAtIndex:indexPath.row];
    }
    
    // Sincronizar celda (vista) y modelo (curso)
    
    cell.imageView.image = curso.logo;
    cell.textLabel.text = curso.empresa;
    cell.detailTextLabel.text = curso.ciudad;
    
    // La devolvemos
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // hemos borrado lo propuesto por XCode
    
    // Suponemos que estamos en un navigation controller
    
    // Averiguamos de que anuncio se trata
    
    WTMCursoPadModelo *curso = nil;
    if (indexPath.section == SECCION_IDIOMAS) {
        curso = [self.modeloCursoTablon idiomasAtIndex:indexPath.row];
    } else if (indexPath.section == SECCION_BUCEO) {
        curso = [self.modeloCursoTablon buceoAtIndex:indexPath.row];
    } else {
        curso = [self.modeloCursoTablon cocinaAtIndex:indexPath.row];
    }
    
    /*Ya no nos ace falta por el delegate
     // Creamos un controlador para dicho curso
     
     WTMCursoPadViewController *cursoVC = [[WTMCursoPadViewController alloc] initWithModelo:curso];
     
     // HAcemos un Push al navigation Controller dentro del cual estamos
     
     [self.navigationController pushViewController:cursoVC
     animated:YES];
     */
    
   [self.delegate cursoPadTablonTableViewController:self didSelecteCurso:curso];
    
    // Crear una Notificación y la vamos a enviar
    NSNotification *n =[NSNotification notificationWithName:NEW_CURSO_NOTIFICACION
                                                     object:self
                                                   userInfo:@{CURSO_KEY: curso}];
    
    [[NSNotificationCenter defaultCenter] postNotification:n];
    
}


@end
