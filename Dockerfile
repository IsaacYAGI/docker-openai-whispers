FROM python:3.8.2

RUN apt update && apt -y install ffmpeg

RUN pip install setuptools-rust

ENV PATH="$HOME/.cargo/bin:$PATH"

RUN pip install --upgrade pip

RUN pip install -U openai-whisper==20230124

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


RUN mkdir /audios

WORKDIR /audios

CMD ["bash"]