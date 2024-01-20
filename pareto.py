import matplotlib.pyplot as plt

# Causas y sus frecuencias (datos hipotéticos)
causas = ["Subproceso No Optimizado", "Falta de Sistema Centralizado", "Tecnología limitada",
          "Falta de Capacitación", "Políticas No Claras", "Desconocimiento de Importancia"]
frecuencias = [10, 8, 5, 12, 6, 4]

# Ordenar causas por frecuencia descendente
causas_ordenadas = [x for _, x in sorted(zip(frecuencias, causas), reverse=True)]
frecuencias_ordenadas = sorted(frecuencias, reverse=True)

# Calcular la frecuencia acumulativa y el porcentaje acumulativo
frecuencia_acumulativa = [sum(frecuencias_ordenadas[:i+1]) for i in range(len(frecuencias_ordenadas))]
porcentaje_acumulativo = [freq / sum(frecuencias_ordenadas) * 100 for freq in frecuencia_acumulativa]

# Crear el Diagrama de Pareto
fig, ax1 = plt.subplots(figsize=(10, 6))

ax1.bar(causas_ordenadas, frecuencias_ordenadas, color='b', alpha=0.7, align='center')
ax1.set_xlabel('Causas', fontsize=12)
ax1.set_ylabel('Frecuencia', color='b', fontsize=12)
ax1.tick_params(axis='x', rotation=45, labelsize=10) 

ax2 = ax1.twinx()
ax2.plot(causas_ordenadas, porcentaje_acumulativo, 'r-')
ax2.set_ylabel('Porcentaje Acumulativo', color='r', fontsize=12)

plt.title('Diagrama de Pareto - Causas del Problema', fontsize=14)
plt.tight_layout()
plt.show()