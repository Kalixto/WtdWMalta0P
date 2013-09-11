//
//  WTMCursoPadTablonModelo.h
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WTMCursoPadModelo.h"

@interface WTMCursoPadTablonModelo : NSObject

// Definimos 3 tipos de Cursos: Idiomas, Buceo y Cocina
// No lo ponemos en .h lo ocultamo en .m


// loas siguientes propiedades si las definimos aqui y seran las que contengan
// el número de Anuncios por tipo de Cursos: idiomas, buceo y cocina

@property (readonly, nonatomic) int idiomasCount;
@property (readonly, nonatomic) int buceoCount;
@property (readonly, nonatomic) int cocinaCount;

// Métodos

-(WTMCursoPadModelo *) idiomasAtIndex: (int) index;
-(WTMCursoPadModelo *) buceoAtIndex: (int) index;
-(WTMCursoPadModelo *) cocinaAtIndex: (int) index;

@end
