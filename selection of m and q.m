

m = [3 6 9 12 15];  % Different values of m
wx = logspace(-1, 1, 1000);  % Frequency range
colors = ['r' 'g' 'b' 'c' 'm' 'k'];  % Color codes for different Q values
Q = [0.2 0.3 0.5 0.7 1 6];  % Different Q values

for y = 1:3
    figure;  % Create a new figure for each value of m
    for i = 1:6
        % Calculate Gain
        Gain = (8/pi^2) * (wx.^2 * (m(y) - 1)) ./ ... % Use element-wise division
            sqrt((m(y) * (wx.^2) - 1).^2 + (Q(i)^2 * (wx.^2) .* (wx.^2 - 1).^2 * (m(y) - 1)^2)); 

        % Plot the Gain vs. wx
        semilogx(wx, Gain, 'color', colors(i), 'LineWidth', 5);
        hold on;  % Hold on to plot multiple lines
    end
    
    % Add legend, title, and labels
    legend(arrayfun(@(q) sprintf('Q=%.1f', q), Q, 'UniformOutput', false));  % Dynamic legend
    title(['|G| (\omega) vs \omega with m = ' num2str(m(y))], 'FontSize', 18);
    xlabel('\omega_x', 'FontSize', 18);
    ylabel('|G| (\omega_x)', 'FontSize', 18);
    grid on;  
end
