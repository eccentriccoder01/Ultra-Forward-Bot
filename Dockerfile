FROM python:3.8-slim-buster

# Update system and install dependencies
RUN apt update && apt upgrade -y && apt install -y git

# Clone the repository (Only if building directly from a blank container)
# RUN git clone https://github.com/JishuDeveloper/Ultra-Forward-Bot.git

# Copy requirements and install dependencies
COPY requirements.txt /requirements.txt
RUN pip3 install --upgrade pip && pip3 install -r /requirements.txt

# Set working directory
WORKDIR /Ultra-Forward-Bot

# Copy all project files
COPY . .

# Ensure start.sh has execute permissions
RUN chmod +x start.sh

# Start the bot
CMD ["/bin/bash", "./start.sh"]
