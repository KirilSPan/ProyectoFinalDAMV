Gestión de Piezas de Vehículo - Extensión para Microsoft Dynamics 365 Business Central
📋 Descripción del Proyecto
Esta extensión para Microsoft Dynamics 365 Business Central está diseñada para empresas y talleres que necesitan llevar un control eficiente de las piezas de vehículo y las actividades relacionadas con su mantenimiento y reparación. La solución proporciona una interfaz intuitiva y funcional para gestionar marcas, modelos, piezas sustituidas y costos asociados, todo dentro del entorno del ERP de Business Central.

Esta versión inicial (beta) incluye funcionalidades clave como la gestión de marcas y modelos, asignación de piezas a vehículos específicos, generación de informes detallados, y personalización para adaptarse a los requerimientos de cada cliente. El objetivo es proporcionar un sistema flexible y extensible que facilite la operatividad y la toma de decisiones empresariales.

🚀 Funcionalidades Principales
Gestión de Vehículos

Registro de vehículos con datos detallados, como matrícula, marca, modelo, tipo de transmisión, número de puertas, y cliente asociado.
Visualización de imágenes del vehículo y gestión de documentos asociados.
Gestión de Piezas

Asociación de piezas específicas a un vehículo.
Registro de datos clave: estado de la pieza, proveedor, responsable de la sustitución, precio, fecha de cambio, y más.
Validación automática para garantizar la consistencia de los datos.
Gestión de Marcas y Modelos

Registro y visualización de marcas y sus modelos asociados.
Posibilidad de importar marcas y modelos desde un archivo Excel.
Informes Personalizados

Generación de informes detallados sobre piezas sustituidas, con filtros personalizados (por matrícula, cliente, etc.).
Posibilidad de incluir información del cliente, como nombre y dirección, para un análisis más completo.
Personalización

Totalmente adaptable para satisfacer los requerimientos específicos de cada cliente.
Diseño modular para facilitar la extensión y el mantenimiento de la solución.
🛠️ Tecnologías Utilizadas
Lenguaje de programación: AL (Application Language para Business Central)
Plataforma: Microsoft Dynamics 365 Business Central
Base de datos: SQL Server (integrado en Business Central)
Herramientas: Visual Studio Code, RDLC Report Builder
Formatos soportados para importación/exportación: Excel (archivo .xlsx)
📖 Manual de Uso
1. Configuración Inicial
Asegúrate de haber instalado y publicado la extensión en tu entorno de Business Central.
Accede a las páginas de configuración incluidas en la extensión para ajustar las opciones básicas.
2. Gestión de Vehículos
Ve a la página de "Ficha del Coche" para registrar un nuevo vehículo.
Introduce la matrícula, selecciona la marca y el modelo, y agrega cualquier información adicional.
3. Gestión de Piezas
Desde la ficha de un vehículo, utiliza la sección "Piezas Sustituidas" para registrar o visualizar piezas relacionadas con ese vehículo.
Asegúrate de registrar correctamente el proveedor y el responsable de la sustitución.
4. Importación de Datos
Utiliza la acción "Importar Marcas y Modelos" para cargar un archivo Excel con las marcas y modelos de vehículos.
5. Generación de Informes
Accede a la acción "Informe de Piezas" para generar un reporte detallado.
Aplica filtros personalizados, como matrícula o cliente, para obtener resultados específicos.
🐞 Problemas y Resoluciones
Gestión de marcas y modelos:

Se optó por crear tablas específicas para marcas y modelos, evitando el uso de enumeraciones (enum) para garantizar la flexibilidad.
Validación de matrículas:

Se implementó una validación específica para matrículas españolas utilizando expresiones regulares, asegurando la integridad de los datos.
Optimización del tipo de transmisión:

El campo "Tipo de Transmisión" inicialmente se implementó como un Option, pero se cambió a un Enum para permitir futuras extensiones y personalización.
Informes vinculados:

Se solucionaron problemas relacionados con la transmisión de filtros dinámicos al informe mediante la utilización de funciones específicas como SetSelectionFilter.
🌟 Conclusiones
El desarrollo de esta extensión refuerza la capacidad de Business Central como una herramienta de gestión integral. La solución no solo mejora la eficiencia operativa, sino que también facilita la toma de decisiones al ofrecer un control detallado de los vehículos y las piezas utilizadas.

Aunque esta es una versión inicial (beta), se ha diseñado para ser adaptable y escalable. Cada cliente podrá personalizar la solución según sus necesidades específicas, asegurando que se integre perfectamente con sus procesos empresariales.

🔗 Fuentes
Documentación Oficial de Microsoft Business Central
YZHUMS Blog - Recursos para desarrolladores de Business Central
ChatGPT - OpenAI: Asistencia técnica y generación de ideas durante el desarrollo de la extensión.
