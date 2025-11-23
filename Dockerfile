FROM python:3.11-slim

# Tizim kutubxonalarini o'rnatish
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgomp1 \
    libgthread-2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Ish katalogini sozlash
WORKDIR /app

# Requirements faylini nusxalash va o'rnatish
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kodlarni nusxalash
COPY . .

# Kerakli papkalarni yaratish
RUN mkdir -p temp_images result_images

# Botni ishga tushirish
CMD ["python", "main.py"]
