<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>


#Artweb

Artweb es una aplicación web desarrollada con Laravel 10 (backend) y Vue 3 + Inertia.js (frontend). Implementa autenticación, roles, un panel de usuario, un panel administrativo, validaciones en el servidor y un sistema completo de CRUD basado en MVC. Este proyecto constituye la base inicial para una futura plataforma artística con mayores funcionalidades.

#Video Examen


#Descripción del proyecto

El objetivo principal del proyecto es implementar un sistema funcional que utilice el patrón MVC, autenticación con roles y un manejo adecuado de datos sensibles en el Back-End.
Dentro de los requerimientos académicos solicitados se incluyó:

--  Validar datos sensibles directamente en el servidor, no solo con JavaScript.
     En este proyecto se valida de forma estricta que:

-- La edad ingresada sea válida.

-- El correo electrónico sea único antes de almacenarlo en la base de datos.

-- Esto evita ingreso incorrecto o manipulación desde el Front-End.

Cuando existe una relación entre tablas, no se debe permitir ingresar manualmente el ID de la relación, sino seleccionar mediante dropdown dinámico.
Por ejemplo, las opciones de interés dependen de una categoría.
El usuario administrador primero selecciona una categoría, y automáticamente se cargan las opciones relacionadas para evitar errores y garantizar integridad de datos.

El sistema también separa  el acceso del administrador del de un usuario normal:
un administrador nunca accede al dashboard normal, sino a su panel administrativo personalizado.

#Tecnologías utilizadas

-- Laravel 10

-- Vue 3

-- Inertia.js

-- Laravel Breeze

-- Tailwind CSS

-- MySQL / MariaDB

-- Patrón MVC (Model–View–Controller)

#Modelos implementados

Se utilizaron modelos de Laravel para representar las entidades principales del sistema:

-- User

Contiene información básica del usuario.

Incluye campo rol para distinguir entre usuario normal y administrador.

Validación back-end:

El correo debe ser único (unique:users,email).

Restricciones estándar de Laravel Breeze.

-- CategoriaInteres

Representa las categorías principales (por ejemplo: Pintura, Música, Escultura).

Relación:

Una categoría tiene muchas opciones de interés (hasMany).

-- OpcionInteres

Representa opciones más específicas dentro de una categoría.

Relación:

Pertenece a una categoría (belongsTo).

Se carga dinámicamente en formularios según la categoría seleccionada.

-- Etiqueta

Modelo simple para etiquetas administrables desde el panel del administrador.

UserIntereses

Contiene los intereses registrados por cada usuario.

-- Validaciones:

La edad debe ser un número válido y positivo.

Otros campos se validan según las reglas del formulario.

#Controladores implementados

-- UserInteresesController

CRUD completo para que el usuario gestione sus intereses.

Manejo de validaciones y protección de rutas.

-- CategoriaInteresController

CRUD para el administrador.

Evita ingreso manual de claves foráneas (solo se seleccionan desde dropdowns).

-- OpcionInteresController

Carga dinámica de opciones según la categoría.

Validación en Back-End de la relación categoría → opción.

-- EtiquetaController

CRUD simple para etiquetas.

-- AuthenticatedSessionController

Controla inicio y cierre de sesión.

Redirección basada en rol:

Usuario normal → Dashboard de usuario.

Administrador → Panel administrativo.

