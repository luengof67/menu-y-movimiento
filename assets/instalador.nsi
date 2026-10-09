; Instalador de Menú y Movimiento (por usuario, sin permisos de administrador)
Unicode true
!ifndef VERSION
  !define VERSION "0.0.0"
!endif
!define APPNAME "Menú y Movimiento"
!define EXENAME "Menu y Movimiento.exe"
!define REGKEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\MenuYMovimiento"

Name "${APPNAME}"
OutFile "..\out\MenuYMovimiento-Instalador.exe"
InstallDir "$LOCALAPPDATA\Programs\Menu y Movimiento"
RequestExecutionLevel user
SetCompressor /SOLID lzma
Icon "icon.ico"
UninstallIcon "icon.ico"
BrandingText "${APPNAME} ${VERSION}"
VIProductVersion "${VERSION}.0"
VIAddVersionKey "ProductName" "${APPNAME}"
VIAddVersionKey "FileDescription" "Instalador de ${APPNAME}"
VIAddVersionKey "ProductVersion" "${VERSION}"
VIAddVersionKey "FileVersion" "${VERSION}"
VIAddVersionKey "LegalCopyright" "${APPNAME}"

!include "MUI2.nsh"
!define MUI_ICON "icon.ico"
!define MUI_UNICON "icon.ico"
!define MUI_FINISHPAGE_RUN "$INSTDIR\${EXENAME}"
!define MUI_FINISHPAGE_RUN_TEXT "Abrir ${APPNAME}"
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_LANGUAGE "Spanish"

Section "Instalar"
  ; Cierra la app si está abierta para poder sustituirla
  nsExec::Exec 'taskkill /IM "${EXENAME}" /F'
  Sleep 800
  SetOutPath "$INSTDIR"
  File "..\out\app\${EXENAME}"
  File "icon.ico"
  WriteUninstaller "$INSTDIR\Desinstalar.exe"
  CreateShortcut "$SMPROGRAMS\${APPNAME}.lnk" "$INSTDIR\${EXENAME}" "" "$INSTDIR\icon.ico"
  CreateShortcut "$DESKTOP\${APPNAME}.lnk" "$INSTDIR\${EXENAME}" "" "$INSTDIR\icon.ico"
  WriteRegStr HKCU "${REGKEY}" "DisplayName" "${APPNAME}"
  WriteRegStr HKCU "${REGKEY}" "DisplayVersion" "${VERSION}"
  WriteRegStr HKCU "${REGKEY}" "Publisher" "${APPNAME}"
  WriteRegStr HKCU "${REGKEY}" "DisplayIcon" "$INSTDIR\icon.ico"
  WriteRegStr HKCU "${REGKEY}" "InstallLocation" "$INSTDIR"
  WriteRegStr HKCU "${REGKEY}" "UninstallString" '"$INSTDIR\Desinstalar.exe"'
  WriteRegDWORD HKCU "${REGKEY}" "NoModify" 1
  WriteRegDWORD HKCU "${REGKEY}" "NoRepair" 1
  WriteRegDWORD HKCU "${REGKEY}" "EstimatedSize" 3500
SectionEnd

Section "Uninstall"
  nsExec::Exec 'taskkill /IM "${EXENAME}" /F'
  Sleep 800
  Delete "$INSTDIR\${EXENAME}"
  Delete "$INSTDIR\icon.ico"
  Delete "$INSTDIR\Desinstalar.exe"
  RMDir "$INSTDIR"
  Delete "$SMPROGRAMS\${APPNAME}.lnk"
  Delete "$DESKTOP\${APPNAME}.lnk"
  DeleteRegKey HKCU "${REGKEY}"
  ; Los datos (perfil, mediciones) se conservan en %APPDATA%\${EXENAME}
SectionEnd
