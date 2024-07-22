# Sistema POS prueba tecnica LinkTick
El proyecto POS esta compuesto en su momento por 2 microservicios.
  
El primero, es una pagina web construida con la tecnologia flutter bajo la estandarizacion de clean architecture, lo que nos permite brindar al usuario una interfaz interactiva y responsiva.  
  
El segundo, es un componente backend construido en kotlin, igualmente bajo la estandarizacion de clean architecture, su responsabilidad es contener toda la logica del dominio asociada al sistema,
brindando los datos y las funcionalidades a los distintos medios que la requieran.
  
El uso de Domain Driven Design o tambien llamado DDD, nos permite centrar la atención en la lógica de negocio y el dominio subyacente de una aplicación. Al utilizar DDD en un proyecto que involucra Flutter para el frontend y Kotlin para el backend,
podemos lograr una arquitectura coherente y bien organizada que facilita el desarrollo y el mantenimiento a largo plazo.
  
Ambos proyectos hacen uso de una arquitectura hexagonal o tambien llamada de puertos y adaptodes, es un estilo de diseño de software que promueve una separación clara entre el núcleo de la aplicación (dominio y lógica de negocio)
y sus dependencias externas (interfaces de usuario, bases de datos, servicios externos).
  
![Hexagonal](https://github.com/user-attachments/assets/ab3eca4b-ca2e-4075-a497-2730bd953354)

- Diagrama de arquitectua a alto nivel:
  
![POS](https://github.com/user-attachments/assets/7a229c8c-2d42-4cd2-81fd-3b4ecbbb7560)

- Modelo de base de datos dominio:
  
![posdb](https://github.com/user-attachments/assets/50c9cc87-b210-46ed-8017-6ab25e786e2a)

  
## Requisitos
Antes de comenzar, asegúrate de tener instalados los siguientes requisitos:
- Docker
- Docker compose

## Instalacion
1. Clona el repositorio
 ```bash 
   git clone https://github.com/julian2613/linkTickTest
 ```
2. Ingresa a la carpeta pos-ms
 ```bash 
   cd pos-ms
 ```
3. Levanta el contenedor mediante docker-compose
 ```bash 
   docker-compose up
 ```
4. Ingresa a la carpeta pos
 ```bash 
   cd pos
 ```
5. Levanta el contenedor mediante docker-compose

 ```bash 
   docker-compose up
 ```
