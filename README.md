# Proyecto_Integrador_1.Correccion
# 🧭 Proyecto_Integrador_1 – Localización

Este proyecto implementa un sistema modular de **localización probabilística** para robots móviles, integrando planificación, control, simulación, sensado y estimación de estado.  
El objetivo es comparar el desempeño de los filtros **EKF**, **UKF** y **MCL** en un entorno controlado, utilizando datos simulados de GPS e IMU.

---

## 📂 Estructura del Proyecto

El código está organizado de forma modular para facilitar la comprensión y el mantenimiento:

| Carpeta / Archivo | Descripción |
|--------------------|-------------|
| **`main.m`** | Script principal que orquesta la simulación completa: mapa, control, sensores y estimadores. |
| **`/auxiliar`** | Contiene los módulos funcionales del sistema. |
| ├── `generarMapa.m` | Genera el mapa de ocupación con obstáculos fijos. |
| ├── `planificar_ruta.m` | Ejecuta el algoritmo **RRT\*** para obtener una ruta libre de colisiones. |
| ├── `controlador_robot.m` | Implementa el controlador **Pure Pursuit** para seguir los *waypoints*. |
| ├── `motion_model.m` | Modelo cinemático diferencial del robot (ground truth). |
| ├── `simulate_sensors.m` | Simula mediciones de GPS e IMU con ruido. |
| ├── `ekf_localization.m`, `ukf_localization.m`, `mcl_localization.m` | Implementaciones de los filtros de localización. |
| ├── `graficar_evolucion_estados.m` | Visualiza las trayectorias reales y estimadas. |
| ├── `calcular_metricas.m` | Calcula métricas de desempeño (ATE, RPE, RMSE, NEES, NIS, etc.). |
| └── `guardar_formato_tum.m` | Exporta trayectorias en formato TUM para análisis externo. |

---

## ⚙️ Cómo ejecutar

1. Clona este repositorio en tu equipo.  
2. Abre **MATLAB** y navega a la carpeta raíz del proyecto.  
3. Ejecuta el script principal:

```matlab
run('main.m')
