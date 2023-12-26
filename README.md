# MarvelSuperpowers para iOS

App creada con swiftUI como ejercício de fin de módulo de "Ios super poderes" para keepcoding. 
La app consume la famosa API de  [Marvel](https://developer.marvel.com/).
La app está siendo desarrollada en swift nativo y se encuentra en fase de desarrollo.

### Aviso importante !!
 Necesitas ciertos requísitos para su instalación. Entre ellas registro prevío en la web de [Marvel](https://developer.marvel.com/).
 La App está en proceso de desarrollo por lo que algunas funcionalidades no estan implementadas.

# Instalación
- Necesitas seguir los pasos de la web de la API de [Marvel](https://developer.marvel.com/documentation/getting_started)
- Sigue las instrucciones para crearla: https://developer.marvel.com/documentation/authorization
- Debes crear el hash e introducirlo como String en el archivo Networking.swift
<img src="https://github.com/Pablomarke/GitImages/blob/main/marvelsuperpowers/DoHash.png" width="450" /><img src="https://github.com/Pablomarke/GitImages/blob/main/marvelsuperpowers/Hash.png" width="450" />

# Información App

La aplicación ha sido desarrollada en SwiftUI, prescindiendo del uso de dependencias externas. Se ha implementado el patrón de diseño Modelo-Vista-ViewModel (MVVM) de manera integral en toda la aplicación. Cada vista experimenta cambios de estado gestionados mediante Combine, lo que facilita el manejo de la carga de datos después de la respuesta de la API obtenida a través de URLSession.
En principio, se exhiben los primeros 20 héroes en una tabla en el menú principal.  Para próximas versiones se implementara el paginado de estos para poder acceder al total de estos.

La elección de la paleta de colores se basa en los colores característicos de Marvel (rojo, blanco y negro). No obstante, se contempla la necesidad de modificarla en el futuro debido a problemas de legibilidad.

La aplicación sigue un riguroso proceso de pruebas para cada vista y modelo. Se emplea una llamada mockeada con el objetivo de evitar el consumo de llamadas reales, optimizando así el rendimiento y asegurando un entorno controlado durante el desarrollo.
Siguiendo los principios SOLID, se ha procurado maximizar la separación de código.

# Versiones
#### Versión 1.0 (Requisitos bootcamp)
- Visualización de Characters (personajes)
- Visualización de detalle de cada heroe con las series donde aparece.
- Patrón de diseño : MVVM .
- Uso de combine.
- 70% código testado.
  
<img src="https://github.com/Pablomarke/GitImages/blob/main/marvelsuperpowers/Launch.png" width="200" /><img src="https://github.com/Pablomarke/GitImages/blob/main/marvelsuperpowers/Main.png" width="200" /><img src="https://github.com/Pablomarke/GitImages/blob/main/marvelsuperpowers/Detail.png" width="200" />
  
#### Version 1.1 (requisito opcional bootcamp)
- Pantalla de carga de datos.
- Pantalla de error
- Disponible en inglés y Castellano(ESP)
  
<img src="https://github.com/Pablomarke/GitImages/blob/main/marvelsuperpowers/Load.png" width="150" /><img src="https://github.com/Pablomarke/GitImages/blob/main/marvelsuperpowers/Error.png" width="150" />

## En desarrollo...
#### Versión 1.2 (no implementada)
- Paginado y acceso al 100% de los heroes proporcionados por la api.
- Acceso desde el detalle al resto de datos proporcionados por la api.

#### Versión 1.3 (no implementada)
- Ejecución multiplataforma Ipad, Apple Watch y macOS.
# Información extra
### Información Api

- Para el desarrollo de esta app hemos utilizado la API [developer.marvel.comI](https://developer.marvel.com/documentation/generalinfo).
- Toda la documentación [Aquí](https://developer.marvel.com/documentation/getting_started)
- Necesitaras dos claves que consigues [aquí](https://developer.marvel.com/documentation/getting_started)
 
