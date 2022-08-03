# Imagen oficial de Docker para Python 3.10.5-slim-bullseye. https://hub.docker.com/_/python
FROM python:3.10.5-slim-bullseye

# COPY . /home/example

# Creamos directorio que almacenará los entornos virtuales de Python, y dentro el del proyecto (Si se necesita otro entorno virtual, ejemplo: tests_env, lo crearemos dentro del directorio python_envs)
RUN mkdir -p /home/python_envs/tk_env

# Creamos variable "VIRTUAL_ENV" y le asignamos el directorio del entorno virtual del proyecto
ENV VIRTUAL_ENV=/home/python_envs/tk_env

# Creamos el entorno virtual dentro del directorio de entorno virtual del proyecto, pasándole la variable "VIRTUAL_ENV"
RUN python3 -m venv $VIRTUAL_ENV

# Activamos el entorno virtual del proyecto, Actualizamos la librería "pip" e Instalamos las librerías requeridas de Python según "requirements.txt"
    RUN . $VIRTUAL_ENV/bin/activate \
    && $VIRTUAL_ENV/bin/pip install --upgrade pip

# Agregamos a la variable del "PATH" de Linux nuestro entorno virtual por defecto (al entrar al contenedor, estaremos por defecto dentro del entorno virtual del proyecto)
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
