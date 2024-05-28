
main()
function main()
    % Create a figure window
    mainPanel = uifigure("Name", "Ejercicio 2");
    mainGridLayout = uigridlayout(mainPanel, [1, 1]);
    
    % Create a tab container and a tab
    tabContainer = uitabgroup(mainGridLayout);
    firstTab = uitab(tabContainer, "Title", "Inciso A");
    firstTabGridLayout = uigridlayout(firstTab, [2, 1]);
    
    % Create a dropdown menu
    firstDropdown = uidropdown(firstTabGridLayout, ...
                               "Items", ["K * x(t)", "x(-t)", "x(2*t)", "x(t+5)", "x(t-2)", "x(t/3)", "x(4-2t)"], ...
                               "Value", "x(-t)", ...
                               "ValueChangedFcn", @(src, event) updatePlot(src, event));
    
    % Create axes for plotting
    xfunctionAxes = uiaxes(firstTabGridLayout);
    
    % Define the original function x(t)
    x = @(t) 2 - 2 * (t.^2);
    
    % Plot the original function x(t)
    fplot(xfunctionAxes, x, [-5, 5]);
    ylim(xfunctionAxes, [-20, 5]);
    grid(xfunctionAxes, 'on');
    
    % Define the transformed functions
    functions = {
        @(t) 2 * t, ...      % Placeholder for K * x(t), you need to define the constant K
        @(t) x(-t), ...
        @(t) x(2*t), ...
        @(t) x(t + 5), ...
        @(t) x(t - 2), ...
        @(t) x(t / 3), ...
        @(t) x(4 - 2*t)
    };

    % Callback function to update the plot based on the dropdown selection
    function updatePlot(src, ~)
        val = src.Value;
        idx = find(strcmp(src.Items, val));
        
        % Clear the current plot
        cla(xfunctionAxes);
        
        % Plot the selected function
        fplot(xfunctionAxes, functions{idx}, [-5, 5]);
        ylim(xfunctionAxes, [-20, 5]);
        grid(xfunctionAxes, 'on');
    end
end
