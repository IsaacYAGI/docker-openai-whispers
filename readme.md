# Imagen para correr openai/whispers en un contenedor de docker
En este repositorio se encuentra un archivo Dockerfile con toda la configuración necesaria para correr el proyecto de whisper. Consta de una carpeta audios que debe ser montada al momento de correr el contenedor a fin de poder compartir los archivos con el host de manera sencilla.

# Instalación

- Instalar Docker
- Construir la imagen

```
docker build -t docker-openai-whisper:latest .
```

- Correr la imagen

```
docker run --rm -it -v $PWD\audios:/audios docker-openai-whisper:latest
```

Luego de correr la imagen estaremos dentro del contenedor en la carpeta `/audios` donde podremos ejecutar el comando de whisper

Ej:
```
whisper audio.ogg --model tiny -f txt --language Spanish
```

La primera vez y siempre que se levante el contenedor demorará un poco porque debe descargar el modelo seleccionado, en el caso del comando de arriba es el `tiny`

Una vez corra el comando, podremos ver la salida del mismo en un archivo con el mismo nombre con extensión `.txt` en nuestra carpeta montada `/audios`

Para ver un listado de opciones posibles para usar con whisper referirse a su comando de ayuda

```
whisper --help
```