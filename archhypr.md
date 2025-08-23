# Pacotes Arch Derinho ❤️ organizados

## Sistema Base
```bash
sudo pacman -Sy
sudo pacman -S archlinux-keyring archinstall
```
- **archlinux-keyring**: Chaves de verificação para pacotes do Arch Linux
- **archinstall**: Script de instalação oficial do Arch Linux

## Sistema Gráfico
```bash
sudo pacman -S xorg-server xorg-xinit
sudo pacman -S hyprland kitty
sudo pacman -S xdg-desktop-portal xdg-desktop-portal-hyprland
sudo pacman -S wofi
sudo pacman -S foot
```
- **xorg-server**: Servidor gráfico X11
- **xorg-xinit**: Utilitário para inicializar o X11
- **hyprland**: Compositor Wayland tiling dinâmico
- **kitty**: Emulador de terminal moderno
- **xdg-desktop-portal**: Framework para integração desktop
- **xdg-desktop-portal-hyprland**: Portal específico para Hyprland
- **wofi**: Launcher de aplicações para Wayland
- **foot**: Emulador de terminal leve para Wayland

## VirtualBox
```bash
sudo pacman -S virtualbox-guest-utils
sudo systemctl enable vboxservice.service
```
- **virtualbox-guest-utils**: Utilitários para VMs VirtualBox
- **vboxservice.service**: Serviço do VirtualBox Guest Additions

## Drivers NVIDIA
```bash
sudo pacman -S nvidia-dkms
sudo pacman -S linux-zen-headers
sudo pacman -S nvidia-utils
sudo pacman -S linux-headers
```
- **nvidia-dkms**: Driver NVIDIA com suporte DKMS
- **linux-zen-headers**: Headers do kernel Linux Zen
- **nvidia-utils**: Utilitários NVIDIA
- **linux-headers**: Headers do kernel Linux padrão

## Fontes
```bash
sudo pacman -S ttf-dejavu noto-fonts noto-fonts-emoji ttf-liberation
```
- **ttf-dejavu**: Família de fontes DejaVu
- **noto-fonts**: Fontes Google Noto
- **noto-fonts-emoji**: Emojis da família Noto
- **ttf-liberation**: Fontes Liberation (compatíveis com Times, Arial, Courier)

## Multimídia
```bash
sudo pacman -S gst-libav gst-plugins-bad gst-plugins-good gst-plugins-ugly ffmpeg gstreamer
sudo pacman -S firefox vlc libreoffice-fresh
sudo pacman -S hyprpaper
sudo pacman -S xwallpaper
```
- **gst-libav**: Plugin GStreamer para libav
- **gst-plugins-bad**: Plugins GStreamer de qualidade questionável
- **gst-plugins-good**: Plugins GStreamer de boa qualidade
- **gst-plugins-ugly**: Plugins GStreamer com problemas de licença
- **ffmpeg**: Framework multimídia completo
- **gstreamer**: Framework de pipeline multimídia
- **firefox**: Navegador web da Mozilla
- **vlc**: Player de vídeo versátil
- **libreoffice-fresh**: Suíte de escritório LibreOffice (versão mais recente)
- **hyprpaper**: Gerenciador de wallpaper para Hyprland
- **xwallpaper**: Utilitário para definir wallpapers no X11

## Desenvolvimento
```bash
sudo pacman -S gcc wget curl
sudo pacman -S nano
```
- **gcc**: Compilador GNU C/C++
- **wget**: Utilitário para download de arquivos via HTTP/HTTPS
- **curl**: Ferramenta para transferência de dados via URLs
- **nano**: Editor de texto simples no terminal

## Terminal
```bash
sudo pacman -S tilix
```
- **tilix**: Emulador de terminal com suporte a tiles
