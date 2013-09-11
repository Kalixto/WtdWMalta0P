//
//  WTMAnuncioPadModelo.m
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import "WTMAnuncioPadModelo.h"

@implementation WTMAnuncioPadModelo

#pragma mark - Métodos de Clase

// Implemenmtación de los Constructores (métodos de clase)
+(id) anuncioWithNombre: (NSString *) aNombre
                   Logo: (UIImage *) aLogo
                  Notas: (NSString *) aNotas
                    Url: (NSURL *) aUrl
                   Foto: (UIImage *) aFoto Matriz:(NSString *)aMatriz{
    return [[self alloc] initWithNombre:aNombre
                                   Logo:aLogo
                                  Notas:aNotas
                                    Url:aUrl
                                   Foto:aFoto
                                 Matriz:aMatriz];
}

+(id) anuncioWithNombre: (NSString *) aNombre
                   Logo: (UIImage *) aLogo
                  Notas: (NSString *) aNotas
                   Foto: (UIImage *) aFoto{
    return [[self alloc] initWithNombre:aNombre
                                   Logo:aLogo
                                  Notas:aNotas
                                   Foto:aFoto];
}


#pragma mark - Init

// Implementación de los Inicializadores: Inicializador Designado

-(id) initWithNombre: (NSString *) aNombre
                Logo: (UIImage *) aLogo
               Notas: (NSString *) aNotas
                 Url: (NSURL *) aUrl
                Foto: (UIImage *) aFoto
              Matriz:(NSString *)aMatriz{
    
    if (self = [super init]) {
        // Asignar los parámetros a las variables de instancia
        _nombre = aNombre;
        _logo = aLogo;
        _notas = aNotas;
        _url = aUrl;
        _foto = aFoto;
        _matriz = aMatriz;
    }
    return  self;
}

// Implementación del Inicializador de Coveniencia (sin url)

-(id) initWithNombre: (NSString *) aNombre
                Logo: (UIImage *) aLogo
               Notas: (NSString *) aNotas
                Foto: (UIImage *) aFoto{
    // Llamamos al inicializador Designado
    return [self initWithNombre:aNombre
                           Logo: aLogo
                          Notas:aNotas
                            Url:nil
                           Foto:aFoto
                         Matriz:nil];
}

@end
