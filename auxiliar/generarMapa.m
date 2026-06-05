function generarMapa()
    % generarMapa.m
    % Genera un mapa de ocupación binario con dos "L" y laterales abiertos
    
    % --- Parámetros del mapa ---
    resolucion = 1;       % celdas por metro
    ancho = 25;           % en metros
    alto = 25;            % en metros
    
    % --- Crear matriz inicial ---
    % 0 = libre (blanco), 1 = ocupado (negro)
    rawMap = zeros(alto, ancho);
    
    % Muros perimetrales
    rawMap(1,:) = 1; 
    rawMap(end,:) = 1;
    rawMap(:,1) = 1; 
    rawMap(:,end) = 1;

% Barra vertical en x=5, desde y=20 hasta y=25
rawMap(20:25, 5) = 1;

% Barra horizontal en y=20, desde x=5 hasta x=10
rawMap(20, 5:10) = 1;

    
    % --- Obstáculo en forma de L inferior ---
    rawMap(10:12, 10) = 1;       % vertical
    rawMap(12, 10:15) = 1;       % horizontal
    
    % --- Obstáculo en forma de L superior ---
    rawMap(20:25, 15) = 1;       % vertical
    rawMap(20, 15:22) = 1;       % horizontal
    
    % --- Obstáculo lateral izquierdo (solo barra horizontal) ---
    rawMap(12, 1:5) = 1;         % fila y=12, de x=1 a 5
    
    % --- Obstáculo lateral derecho superior (solo barra horizontal) ---
    rawMap(12, 20:25) = 1;       % fila y=12, de x=20 a 25
    
    % --- Obstáculo lateral derecho inferior (solo barra horizontal) ---
    rawMap(5, 20:25) = 1;        % fila y=5, de x=20 a 25

     % --- Barra inferior en forma de L ---
    rawMap(1:5, 10) = 1;     % vertical en x=10, y=0:5
    rawMap(5, 5:10) = 1;     % horizontal en y=5, x=5:10
    

    % --- Crear objeto OccupancyGrid ---
    map = occupancyMap(rawMap, resolucion);
    
    % --- Visualización ---
    figure;
    show(map);
    title('Mapa de Ocupación Binario con Obstáculos en Forma de L y Laterales');
    xlabel('X [m]');
    ylabel('Y [m]');
    
    % --- Guardar en archivo MAT ---
    save('mapaLaberintoFinal.mat','map');
    
    fprintf('Mapa generado y guardado en mapaLaberintoFinal.mat\n');
end


%[appendix]{"version":"1.0"}
%---
