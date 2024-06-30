App de consulta de información sobre series, con las siguientes características:

* Uso de SwiftUI para la interfaz de usuario.
* Arquitectura basada en principios de Clean Architecture con capas para interactores (carga de datos), lógica de negocio, y view models.
* Uso de librería propia para llamadas de red, y conexión a la base de datos remota para búsqueda y consulta de datos.
* Uso de SwiftData para guardado en local de las series favoritas, y evitar nuevas llamadas de red para estas consultas.
* Uso de caché para el guardado temporal de las imágenes de las series consultadas.
* Uso de librería OSLog para la depuración durante la fase de desarrollo.
