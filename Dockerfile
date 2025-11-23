FROM python:3.11-slim

# Tizim o'zgaruvchilarini sozlash
ENV DEBIAN_FRONTEND=noninteractive

# Tizim paketlarini yangilash va kerakli kutubxonalarni o'rnatish
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    libgomp1 \
    libgthread-2.0-0 \
    libfontconfig1 \
    libice6 \
    && rm -rf /var/lib/apt/lists/*

# Ish katalogini sozlash
WORKDIR /app

# Requirements faylini nusxalash va o'rnatish
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Kodlarni nusxalash
COPY . .

# Kerakli papkalarni yaratish
RUN mkdir -p temp_images result_images

# Botni ishga tushirish
CMD ["python", "main.py"]
