function isentropic_table()
    % Isentropic Flow Relations Table Generator
    % For perfect gas with gamma = 1.4 (air)
    
    clear; clc;
    
    % Gas properties
    gamma = 1.4;  % Specific heat ratio for air
    
    % Mach number range
    M_min = 0.0;
    M_max = 8.0;
    M_step = 0.002;  % Step size
    
    % Generate Mach number array
    M = M_min:M_step:M_max;
    
    % Calculate isentropic relations
    % p0/p = (1 + (gamma-1)/2 * M^2)^(gamma/(gamma-1))
    % rho0/rho = (1 + (gamma-1)/2 * M^2)^(1/(gamma-1))
    % T0/T = 1 + (gamma-1)/2 * M^2
    % A/A* = (1/M) * ((2/(gamma+1)) * (1 + (gamma-1)/2 * M^2))^((gamma+1)/(2*(gamma-1)))
    
    p0_p = (1 + (gamma-1)/2 * M.^2).^(gamma/(gamma-1));
    rho0_rho = (1 + (gamma-1)/2 * M.^2).^(1/(gamma-1));
    T0_T = 1 + (gamma-1)/2 * M.^2;
    
    % Calculate A/A* (area ratio)
    A_Astar = (1./M) .* ((2/(gamma+1)) .* (1 + (gamma-1)/2 * M.^2)).^((gamma+1)/(2*(gamma-1)));
    
    % Create table
    table_data = [M' p0_p' rho0_rho' T0_T' A_Astar'];
    
    % Display table header
    fprintf('\n=====================================================\n');
    fprintf('ISENTROPIC FLOW PROPERTIES (gamma = %.1f)\n', gamma);
    fprintf('=====================================================\n');
    fprintf('   M      p0/p      rho0/rho     T0/T      A/A*\n');
    fprintf('=====================================================\n');
    
    % Display table with formatted output
 %   for i = 1:length(M)
 %       fprintf('%6.3f  %9.5f  %9.5f  %9.5f  %9.5f\n', ...
 %               M(i), p0_p(i), rho0_rho(i), T0_T(i), A_Astar(i));
 %   end
    
    fprintf('=====================================================\n');
    
    % Save to CSV file
    filename = 'isentropic_table.csv';
    csv_header = {'M', 'p0_p', 'rho0_rho', 'T0_T', 'A_Astar'};
    
    % Write to CSV
    fid = fopen(filename, 'w');
    fprintf(fid, '%s,%s,%s,%s,%s\n', csv_header{:});
    fclose(fid);
    dlmwrite(filename, table_data, '-append', 'delimiter', ',', 'precision', 10);
    
    fprintf('\nTable saved to: %s\n', filename);
    
    % Optional: Create a plot
    figure('Name', 'Isentropic Flow Relations', 'Position', [100 100 800 600]);
    
    subplot(2,2,1);
    plot(M, p0_p, 'b-', 'LineWidth', 2);
    xlabel('Mach Number (M)');
    ylabel('p_0/p');
    title('Pressure Ratio');
    grid on;
    
    subplot(2,2,2);
    plot(M, rho0_rho, 'r-', 'LineWidth', 2);
    xlabel('Mach Number (M)');
    ylabel('\rho_0/\rho');
    title('Density Ratio');
    grid on;
    
    subplot(2,2,3);
    plot(M, T0_T, 'g-', 'LineWidth', 2);
    xlabel('Mach Number (M)');
    ylabel('T_0/T');
    title('Temperature Ratio');
    grid on;
    
    subplot(2,2,4);
    plot(M, A_Astar, 'm-', 'LineWidth', 2);
    xlabel('Mach Number (M)');
    ylabel('A/A*');
    title('Area Ratio');
    grid on;
    
    sgtitle(sprintf('Isentropic Flow Relations (\\gamma = %.1f)', gamma));
    
end