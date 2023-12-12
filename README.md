# 2023-1-grupo-18

# CRUD (Create, Read, Update, Delete) - Software

Este proyecto se centra en implementar operaciones CRUD (Create, Read, Update, Delete) para un sistema de gestión de productos, solicitudes y reseñas. Permite a los usuarios registrados interactuar con los productos, realizar solicitudes y agregar reseñas.

## Funcionalidades

### Controlador de Productos (Product Controller)

- Ver todos los productos de la página (index) ✅
- Agregar Productos (new/create)✅
- Acceder al detalle de un producto (show) ✅
- Editar un Producto (edit/update) ✅
- Eliminar un Producto (destroy) ✅

### Controlador de Solicitudes de Producto (Product/Request Controller)

- Solicitar o agregar una solicitud a un Producto (new/create) ✅
- Ver las solicitudes de un Producto como administrador o vendedor (index) ✅
- Acceder al detalle de una solicitud (show) ✅
- Editar una solicitud (siempre y cuando el user_id de la solicitud coincida con el id del usuario actual) (edit/update) ✅
- Eliminar una solicitud (solo si pertenece al usuario) (destroy) ✅

### Controlador de Reseñas de Producto (Product/Review Controller)

- Solicitar o agregar una reseña a un Producto (new/create) ✅
- Ver las reseñas de un Producto como administrador, vendedor o usuario (index) ✅
- Acceder al detalle de una reseña (show) ✅
- Editar una reseña (siempre y cuando el user_id de la reseña coincida con el id del usuario actual) (edit/update) ✅
- Eliminar una reseña (solo si pertenece al usuario) (destroy) ✅

### Protección de Páginas para usuarios No registrados ✅

Las páginas requerirán autenticación. Si un usuario no registrado intenta acceder a ellas, será redirigido a la página de inicio "application#index".

### Protección de Páginas para editar y eliminar solicitudes y reseñas ✅

Si un usuario intenta editar o eliminar una solicitud o reseña que no le pertenece, será redirigido a la página de índice respectiva del controlador.

## Controlador de Usuarios (User Controller)

### Atributos

- Nombre ✅
- Correo ✅
- Contraseña ✅
- Foto de Perfil ❌

## Active Admin

El proyecto incluye la integración de Active Admin para gestionar la administración del s

## https://proyecto-software-grupo-18-v1.onrender.com/

#La solicitudes tienen el atributo estado que determina si la solicitud fue aceptada o no, falta mostrar eso en la pagina e informar al cliente de que su pedido fue aceptado 