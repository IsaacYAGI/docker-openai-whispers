FROM python:3.8.2

RUN apt update && apt -y upgrade && apt -y install python3-pip ffmpeg

RUN pip3 install setuptools-rust

RUN echo $PATH

ENV PATH="$HOME/.cargo/bin:$PATH"

RUN echo $PATH

RUN pip3 install --upgrade pip

RUN pip3 install -U openai-whisper==20230124

RUN mkdir /audios

WORKDIR /audios

CMD ["bash"]