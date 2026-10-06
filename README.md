# Menú y Movimiento

Menú semanal para personas con diabetes, con los hidratos de carbono contados en cada comida (raciones de 10 g), lista de la compra y una rutina de ejercicios para casa. Funciona sin internet.

## Descargar

Ve a **Releases** (columna derecha de esta página) y descarga la última versión:

- `MenuYMovimiento.apk` para Android
- `MenuYMovimiento-Windows.zip` para Windows 10/11

Cada vez que se sube un cambio a la rama `main`, GitHub compila las dos versiones solo y publica una versión nueva en Releases (tarda unos 5 minutos).

## Instalar

**Android:** abre el APK en el móvil y permite «instalar apps de origen desconocido» cuando lo pida.

**Windows:** descomprime el ZIP y abre `Menu y Movimiento.exe`. Si aparece «Windows protegió su PC», pulsa «Más información» y «Ejecutar de todas formas».

## Estructura

| Carpeta | Qué contiene |
|---|---|
| `www/` | La app (un solo `index.html` con todo el código, más fuentes e icono). Es lo único que hay que tocar para cambiar menús, platos o ejercicios. |
| `android/` | Proyecto Android (Capacitor) que envuelve `www/`. |
| `neutralino.config.json` | Configuración del programa de Windows (Neutralinojs) que envuelve `www/`. |
| `.github/workflows/build.yml` | Compilación automática de APK y Windows. |

## Compilar en tu ordenador (opcional)

```
npm install
npm run build:windows   # deja el .exe en dist/
npm run build:android   # necesita Android Studio / Android SDK
```

## Aviso

Herramienta orientativa. No sustituye a tu médico, enfermera educadora o nutricionista.
