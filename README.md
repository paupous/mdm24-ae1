# Actividad Evaluable 1
## Pregunta 1
1. *Dado un registro de vehículos que circulan por una autopista, disponemos de su
marca y modelo, país de matriculación, y tipo de vehículo (por número de
ruedas). Con tal de ajustar precios de los peajes, ¿Cuántos vehículos tenemos
por tipo? ¿Cuál es el tipo más frecuente? ¿De qué países tenemos más vehículos?*

    **Classificacion:** Descriptiva

    **Razon**: La pregunta se centra en contar y describir los datos disponibles, sin buscar relaciones entre variables o hacer predicciones. El objetivo es resumir la información existente (frecuencias y distribuciones).

2. *Dado un registro de visualizaciones de un servicio de video-on-demand, donde
disponemos de los datos del usuario, de la película seleccionada, fecha de
visualización y categoría de la película, queremos saber ¿Hay alguna preferencia
en cuanto a género literario según los usuarios y su rango de edad?*

    **Classificacion:** Exploratoria
    
    **Razon**: La pregunta busca identificar tendencias o patrones en los datos (relaciones entre género de película y rangos de edad), sin una hipótesis previa clara ni afirmaciones causales.

3. *Dado un registro de peticiones a un sitio web, vemos que las peticiones que
provienen de una red de telefonía concreta acostumbran a ser incorrectas y
provocarnos errores de servicio. ¿Podemos determinar si en el futuro, los
próximos mensajes de esa red seguirán dando problemas? ¿Hemos notado el
mismo efecto en otras redes de telefonía?*

    **Classificacion:** Predictiva
    
    **Razon**: Se trata de predecir si los problemas continuarán ocurriendo en el futuro, basándose en patrones históricos. Además, la pregunta sugiere comprobar si el patrón se replica en otras redes.

4. *Dado los registros de usuarios de un servicio de compras por internet, los
usuarios pueden agruparse por preferencias de productos comprados.
Queremos saber si ¿Es posible que, dado un usuario al azar y según su historial,
pueda ser directamente asignado a un o diversos grupos?*

    **Classificacion:** Inferencia
    
    **Razon**: Aquí se busca inferir si un usuario, con base en su historial de compras, pertenece a uno o más grupos. Se asocia el historial con patrones de comportamiento grupal.

## Pregunta 2
*Sabemos que un usuario de nuestra red empresarial ha estado usando esta para fines
no relacionados con el trabajo, como por ejemplo tener un servicio web no autorizado
abierto a la red (otros usuarios tienen servicios web activados y autorizados). No
queremos tener que rastrear los puertos de cada PC, y sabemos que la actividad puede
haber cesado. Pero podemos acceder a los registros de conexiones TCP de cada máquina
de cada trabajador (hacia donde abre conexión un PC concreto). Sabemos que nuestros
clientes se conectan desde lugares remotos de forma legítima, como parte de nuestro
negocio, y que un trabajador puede haber habilitado temporalmente servicios de
prueba. Nuestro objetivo es reducir lo posible la lista de posibles culpables, con tal de
explicarles que por favor no expongan nuestros sistemas sin permiso de los operadores
o la dirección.*

1. Obtención de Datos
Para iniciar el análisis, se necesitan los registros de conexiones TCP de cada máquina, idealmente obtenidos a través de herramientas de monitoreo o logs de red como:
    - Registros de conexiones TCP/UDP: Información sobre las conexiones salientes y entrantes de cada PC, incluyendo:
        
        - Dirección IP origen
        - Dirección IP destino
        - Puerto origen y puerto destino
        - Timestamps (marca temporal de cada conexión)
    - Datos complementarios:
        - Lista de servicios autorizados (IPs y puertos conocidos que son legítimos).
        - Lista de direcciones IP de clientes externos legítimos.
        - Registros de usuarios (nombre del trabajador, dirección IP asignada).
        - Registros históricos para detectar servicios activos temporalmente.

2. Tratamiento de Datos

//TODO

3. Preguntas Clave para Resolver el Problema
- ¿Cuáles son los puertos y direcciones IP destino que no están en la lista de servicios autorizados?

- ¿Qué usuarios (o PCs) han generado conexiones a esos destinos o puertos no autorizados?

- Crear una lista de usuarios sospechosos basada en las conexiones no permitidas.

- Detectar tráfico hacia puertos comunes de servicios web no autorizados 

4. Análisis y Visualización de Datos

//TODO

2. Introducción a R

