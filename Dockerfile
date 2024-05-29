FROM python:3.9

WORKDIR /app

COPY requirements.txt /app/
RUN pip3 install -r requirements.txt
RUN pip3 install torch===1.5.0 torchvision===0.6.0 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install accelerate
RUN pip3 install -U "huggingface_hub[cli]"
RUN huggingface-cli login --token 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 --add-to-git-credential
COPY . /app

CMD python3 bot.py
