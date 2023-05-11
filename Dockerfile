FROM python:3.8.2

RUN apt update && apt -y upgrade && apt -y install ffmpeg

RUN pip install setuptools-rust

ENV PATH="$HOME/.cargo/bin:$PATH"

RUN pip install --upgrade pip

RUN pip install -U openai-whisper==20230124

RUN mkdir /audios

WORKDIR /audios

CMD ["bash"]