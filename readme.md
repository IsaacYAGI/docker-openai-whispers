# Imagen para correr openai/whispers en un contenedor de docker
En este repositorio se encuentra un archivo Dockerfile con toda la configuración necesaria para correr el proyecto de whisper. Consta de una carpeta audios que debe ser montada al momento de correr el contenedor a fin de poder compartir los archivos con el host de manera sencilla.

# Instalación

- Instalar Docker
- Verificar que modelos se quieren preinstalar, por lo que descomentamos los que se requieran. Por defecto descargará `tiny`, `base` y `small`

```
# Install model files (comment and uncomment models required)

RUN whisper --model tiny dummy.wav; exit 0
RUN whisper --model base dummy.wav; exit 0
RUN whisper --model small dummy.wav; exit 0
# RUN whisper --model medium dummy.wav; exit 0
# RUN whisper --model large dummy.wav; exit 0
# RUN whisper --model tiny.en dummy.wav; exit 0
# RUN whisper --model base.en dummy.wav; exit 0
# RUN whisper --model small.en dummy.wav; exit 0
# RUN whisper --model medium.en dummy.wav; exit 0
```
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

De contar con el modelo deseado ya preinstalado, el proceso inicia inmediatamente. En caso que no se encuentre preinstalado, la primera vez demorará un poco ya que debe descargar el modelo antes.

Una vez corra el comando, podremos ver la salida del mismo en un archivo con el mismo nombre con extensión `.txt` en nuestra carpeta montada `/audios`

Para ver un listado de opciones posibles para usar con whisper referirse a su comando de ayuda

```
whisper --help
```