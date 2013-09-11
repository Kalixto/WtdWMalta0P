//
//  WTMAnuncioPadTablonModelo.m
//  WtdWMalta0P
//
//  Created by Edu Ardo on 29/08/13.
//  Copyright (c) 2013 Edu Ardo. All rights reserved.
//

#import "WTMAnuncioPadTablonModelo.h"

// Definimos 3 tipos de Anuncios: Eventos, Turismo y Restauración
// No lo ponemos en .h lo ocultamo en .m dentro del @interface

@interface WTMAnuncioPadTablonModelo ()

@property (strong, nonatomic) NSArray *eventos;
@property (strong, nonatomic) NSArray *turismo;
@property (strong, nonatomic) NSArray *restauracion;

@end

@implementation WTMAnuncioPadTablonModelo

#pragma mark - Propiedades

-(int) eventosCount {
    return [self.eventos count];
}
-(int) turismoCount {
    return [self.turismo count];
}
-(int) restauracionCount {
    return  [self.restauracion count];
}

-(id) init {
    
    if (self = [super init]) {
        // Creamos los Modelos
        
        WTMAnuncioPadModelo *marsaxlokk = [WTMAnuncioPadModelo anuncioWithNombre: @"Marsaxlokk"
                                                                            Logo: [UIImage imageNamed:@"WtdM-Ap-Logo-01"]
                                                                           Notas: @"Marsaxlokk is fishing village, it's placed in the south-east of Malta. It has around 3.000 residents. Marsa means harbour and Xlokk means south-easterly."
                                                                             Url: [NSURL URLWithString:@"http://whattodomalta.com/post/18?lang=en"]
                                                                            Foto:[UIImage imageNamed:@"WtdM-Ap-Foto-01.jpeg"]
                                                                          Matriz:@"Every Sunday there is a market"];
        WTMAnuncioPadModelo *dingli = [WTMAnuncioPadModelo anuncioWithNombre: @"Dingli"
                                                                        Logo: [UIImage imageNamed:@"WtdM-Ap-Logo-02"]
                                                                       Notas: @"Motivated by a friend's suggestion, we went to Dingli, small village from the west coast of Malta, 13km away from Valletta. The closest city to Dingli is Rabat, just 2km away. Dingli is know per their cliffs and the Buskett gardens"
                                                                         Url: [NSURL URLWithString:@"http://whattodomalta.com/post/16?lang=en"]
                                                                        Foto:[UIImage imageNamed:@"WtdM-Ap-Foto-02.jpeg"]
                                                                      Matriz:@"Dingli dingli"];
        WTMAnuncioPadModelo * ecogozo = [WTMAnuncioPadModelo anuncioWithNombre: @"EcoGozo 2020"
                                                                          Logo: [UIImage imageNamed:@"WtdM-Ap-Logo-03"]
                                                                         Notas: @"Gozo will become an eco-island at 2020, supported by a sustainable comunity, enthusiastic and committed. This project intend to show the life's quality of Gozo and improve it even more with the education, economic development and social progress."
                                                                           Url: [NSURL URLWithString:@"http://whattodomalta.com/post/15?lang=en"]
                                                                          Foto:[UIImage imageNamed:@"WtdM-Ap-Foto-03"]
                                                                        Matriz:@"Para 2020"];
        WTMAnuncioPadModelo *valetta = [WTMAnuncioPadModelo anuncioWithNombre: @"Valletta 2018"
                                                                         Logo: [UIImage imageNamed:@"WtdM-Ap-Logo-04"]
                                                                        Notas: @"Valletta was unanimously named the European Capital of Culture 2018, by a jury of experts, following a presentation of the Valletta 2018 Foundation October 12, 2012."
                                                                          Url: [NSURL URLWithString:@"http://whattodomalta.com/post/14?lang=en"]
                                                                         Foto:[UIImage imageNamed:@"WtdM-Ap-Foto-04"]
                                                                       Matriz:@"EN 2018"];
        WTMAnuncioPadModelo *donmesquita = [WTMAnuncioPadModelo anuncioWithNombre: @"Don Mesquita"
                                                                             Logo: [UIImage imageNamed:@"WtdM-Ap-Logo-05"]
                                                                            Notas: @"Like you already know, one of our hobbies and like good mediterraneans, we are good cuisine lovers, so we are interesting to suggest you locals where we have been and we liked it, we will rating them, based in a few aspect that we consider basics in a choice of a restaurant or bar, like we told you in the Initial Article Rating: the environment, the food, drink, service, and location, if there is any special characteristic we will tell you about it."
                                                                              Url: [NSURL URLWithString:@"http://whattodomalta.com/post/13?lang=en"]
                                                                             Foto:[UIImage imageNamed:@"WtdM-Ap-Foto-05.jpeg"]
                                                                           Matriz:@"Vinos y comida"];
        WTMAnuncioPadModelo *mdinayrabat = [WTMAnuncioPadModelo anuncioWithNombre: @"Mdina & Rabat"
                                                                             Logo: [UIImage imageNamed:@"WtdM-Ap-Logo-06"]
                                                                            Notas: @"We went to visit Rabat and Mdina the last 19 of October. We were impressed per the strategic situation of Mdina and his protector wall. This image made us travel through the time, placing us in an era in which it was very essential to be protected to survive."
                                                                              Url: [NSURL URLWithString:@"http://whattodomalta.com/post/12?lang=en"]
                                                                             Foto:[UIImage imageNamed:@"WtdM-Ap-Foto-06.jpeg"]
                                                                           Matriz:@"Pues eso"];
        self.eventos = @[ecogozo, valetta];
        self.turismo = @[mdinayrabat, dingli];
        self.restauracion = @[donmesquita, marsaxlokk];
        
    }
    return self;
}

-(WTMAnuncioPadModelo *) eventosAtIndex: (int) index {
    
    return [self.eventos objectAtIndex:index];
    
}
-(WTMAnuncioPadModelo *) turismoAtIndex: (int) index {
    
    return [self.turismo objectAtIndex:index];
    
}
-(WTMAnuncioPadModelo *) restauracionAtIndex: (int) index {
    
    return [self.restauracion objectAtIndex:index];
    
}


@end
