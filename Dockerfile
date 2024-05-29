FROM python:3.9

WORKDIR /app

COPY requirements.txt /app/
RUN pip3 uninstall torch
RUN pip3 cache purge
RUN pip3 install -r requirements.txt
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
RUN pip3 install accelerate
RUN pip3 install -U "huggingface_hub[cli]"
RUN huggingface-cli login --token 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 --add-to-git-credential
COPY . /app

CMD python3 bot.py
