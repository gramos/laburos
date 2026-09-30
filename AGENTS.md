Laburos
=======

## Objetivo

Quiero construir una aplicación personal para buscar oportunidades laborales
que estén alineadas con mi perfil e intereses.

La aplicación va a correr en una Raspberry Pi que tengo disponible y,
eventualmente, quedará ejecutándose de manera permanente, realizando búsquedas
periódicas de nuevas oportunidades laborales.

Quiero que este proyecto sea, además de útil, un proyecto de aprendizaje y
experimentación con Ruby minimalista, Raspberry Pi y Spinel.

## Principios del proyecto

- La aplicación debe estar escrita en Ruby.
- Usar Ruby puro y mantener las dependencias al mínimo.
- Evitar frameworks como Rails.
- El código debe ser simple, pequeño y fácil de entender.
- Quiero desarrollar en baby steps, agregando una capacidad por vez.
- Cada paso debe funcionar correctamente antes de avanzar al siguiente.
- El código debe funcionar primero correctamente en CRuby.
- Uno de los objetivos principales es intentar que la aplicación pueda
  compilarse y ejecutarse con Spinel.
- No quiero evitar automáticamente una solución Ruby correcta solamente porque
  Spinel todavía no la soporte. Si encontramos una incompatibilidad entre
  CRuby y Spinel, quiero aislarla, entenderla y evaluar si puede convertirse
  en una contribución a Spinel.
- Usar tests cuando aporten valor y mantener el proyecto fácil de modificar.

## Visión futura

Eventualmente la aplicación podría:

- Buscar trabajos periódicamente, por ejemplo una vez por hora.
- Buscar siempre sobre un conjunto configurable de fuentes.
- Determinar cuáles de los trabajos encontrados están alineados con mi perfil.
- Detectar cuáles son nuevos y evitar mostrar repetidos.
- Generar una página HTML con los resultados.
- Enviarme por email los nuevos trabajos encontrados.
- Cuando sea técnicamente posible y apropiado, ayudar a automatizar partes
  del proceso de postulación.

Estas funcionalidades NO forman parte necesariamente de la primera versión.

## MVP

La primera versión debe ser deliberadamente pequeña.

Debe:

1. Obtener trabajos desde una única fuente.
2. Filtrar los trabajos que potencialmente me interesan.
3. Detectar cuáles no habían sido encontrados anteriormente.
4. Generar un HTML simple mostrando esos trabajos.
5. Enviarme un email cuando haya trabajos nuevos.

No quiero construir todavía un sistema genérico de scraping, scheduler,
dashboard, IA, múltiples fuentes ni postulaciones automáticas.

Primero quiero conseguir un flujo completo extremadamente pequeño:

    buscar → filtrar → detectar nuevos → generar HTML → enviar email

Una vez que eso funcione correctamente en CRuby, intentaremos ejecutarlo
con Spinel y resolveremos las incompatibilidades que aparezcan.

La primera versión debe ser deliberadamente pequeña.

La primera fuente de trabajos será **Hacker News - "Who is hiring?"**.

Quiero consumir los datos mediante una API, evitando scraping HTML siempre
que sea posible. Para el MVP vamos a obtener los avisos publicados en el
thread mensual de "Who is hiring?" y trabajar sobre esos datos.

Debe:

1. Obtener los trabajos del thread más reciente de Hacker News
   "Who is hiring?".
2. Filtrar los trabajos que potencialmente me interesan.
3. Detectar cuáles no habían sido encontrados anteriormente.
4. Generar un HTML simple mostrando esos trabajos.
5. Enviarme un email cuando haya trabajos nuevos.

## Forma de trabajo

No implementes todo el MVP de una vez.

Quiero que avancemos en baby steps. Antes de escribir código para cada etapa:

1. Explicame qué pequeño problema vamos a resolver.
2. Propone la solución más simple posible.
3. Implementamos solamente ese paso.
4. Lo probamos.
5. Recién entonces avanzamos al siguiente.

Quiero entender las decisiones técnicas y utilizar los problemas que aparezcan
como oportunidades para aprender Ruby, sistemas, Raspberry Pi y Spinel.


<!--
Laburos
========

Quiero hacer una app en principio para buscar trabajos que estén alineados conmigo,
la idea sería buscar siempre en los mismos sitios predefinidos, instalar la app
en un raspberrypi viejo que tengo acá tirado, y que quede corriendo ahí, idealmente
que busque cada cierto tiempo (1h) e idealmente que me postule de ser posible.

- La app va a ser escrita en Ruby
- Quiero que corra con spinel
- Podria ser idealmente una app que genere un html
- Y que me envié esa lista por mail  

Para empezar quiero hacer una primer versión muy chiquita, que genere
un html con la lista de trabajos que me interesan a mí,
y que me envié un mail con los trabajos nuevos encontrados,  
esa sería la primer versión el MVP.
-->
