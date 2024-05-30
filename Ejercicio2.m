
main()
function main()

    mainPanel = uifigure("Name", "Ejercicio 2");
    mainGridLayout = uigridlayout(mainPanel, [1, 1]);
    
    tabContainer = uitabgroup(mainGridLayout);
    firstTab = uitab(tabContainer, "Title", "Inciso A");
    firstTabGridLayout = uigridlayout(firstTab, [1, 2]);
    dropdownAuxGrid = uigridlayout(firstTabGridLayout, [2, 1]); 
    
    firstDropdown = uidropdown(dropdownAuxGrid, ...
                               "Items", ["x(t)","K * x(t)", "x(-t)", "x(2*t)", "x(t+5)", "x(t-2)", "x(t/3)", "x(4-2t)"], ...
                               "Value", "x(t)", ...
                               "ValueChangedFcn", @(src, event) updatePlot(src, event));
    resetbutton = uibutton(dropdownAuxGrid, "Text", "Reset", "ButtonPushedFcn", @(src, event) resetPlot(src, event));
    xfunctionAxes = uiaxes(firstTabGridLayout); 
    xInitial = @(t) 2 - 2 * (t.^2);
    
    fplot(xfunctionAxes, xInitial, [-5, 5]);
    ylim(xfunctionAxes, [-10, 5]);
    grid(xfunctionAxes, 'on');
    hold(xfunctionAxes, 'on');


    secondTab = uitab(tabContainer, "Title", "Inciso B");
    secondTabGridLayout = uigridlayout(secondTab, [2, 2]);
    zSecondDropdownAuxGrid = uigridlayout(secondTabGridLayout, [2, 1]); 
    
    zSecondDropdown = uidropdown(zSecondDropdownAuxGrid, ...
                               "Items", ["x(t)","K * x(t)", "x(-t)", "x(2*t)", "x(t+5)", "x(t-2)", "x(t/3)", "x(4-2t)"], ...
                               "Value", "x(t)", ...
                               "ValueChangedFcn", @(src, event) zUpdatePlot(src, event));
    zResetbutton = uibutton(zSecondDropdownAuxGrid, "Text", "Reset", "ButtonPushedFcn", @(src, event) zResetPlot(src, event));
    zfunctionAxes = uiaxes(secondTabGridLayout);
    A = 1;
    w = 1;
    theta = pi;
    zInitial = @(t) (A * sin(w * t + theta));
    
    fplot(zfunctionAxes, zInitial, [0, 10]);
    grid(zfunctionAxes, 'on');
    hold(zfunctionAxes, 'on');

    ySecondDropdownAuxGrid = uigridlayout(secondTabGridLayout, [2, 1]); 
    
    ySecondDropdown = uidropdown(ySecondDropdownAuxGrid, ...
                               "Items", ["x(t)","K * x(t)", "x(-t)", "x(2*t)", "x(t+5)", "x(t-2)", "x(t/3)", "x(4-2t)"], ...
                               "Value", "x(t)", ...
                               "ValueChangedFcn", @(src, event) yUpdatePlot(src, event));
    yResetbutton = uibutton(ySecondDropdownAuxGrid, "Text", "Reset", "ButtonPushedFcn", @(src, event) yResetPlot(src, event));
    yfunctionAxes = uiaxes(secondTabGridLayout);
    B = 1;
    f = 1;
    thetaa = pi;
    yInitial = @(t) (B * cos((f * 2 * pi * t) + thetaa));
    
    fplot(yfunctionAxes, yInitial, [0, 10]);
    grid(yfunctionAxes, 'on');
    hold(yfunctionAxes, 'on');

    
    K = 2;
    functions = {
        @(t) xInitial(t), ...
        @(t) K * xInitial(t), ...  
        @(t) xInitial(-t), ...
        @(t) xInitial(2*t), ...
        @(t) xInitial(t + 5), ...
        @(t) xInitial(t - 2), ...
        @(t) xInitial(t / 3), ...
        @(t) xInitial(4 - 2*t)
    };
    
    K = 2;
    yfunctions = {
        @(t) yInitial(t), ...
        @(t) K * yInitial(t), ...  
        @(t) yInitial(-t), ...
        @(t) yInitial(2*t), ...
        @(t) yInitial(t + 5), ...
        @(t) yInitial(t - 2), ...
        @(t) yInitial(t / 3), ...
        @(t) yInitial(4 - 2*t)
    };

    
     zfunctions = {
        @(t) zInitial(t), ...
        @(t) K * zInitial(t), ...  
        @(t) zInitial(-t), ...
        @(t) zInitial(2*t), ...
        @(t) zInitial(t + 5), ...
        @(t) zInitial(t - 2), ...
        @(t) zInitial(t / 3), ...
        @(t) zInitial(4 - 2*t)
    };

    function updatePlot(src, ~)
        val = src.Value;
        idx = find(strcmp(src.Items, val));
        
        fplot(xfunctionAxes, functions{idx}, [-10, 10]);
        ylim(xfunctionAxes, [-10, 5]);
        grid(xfunctionAxes, 'on');
    end
    function zUpdatePlot(src, ~)
        val = src.Value;
        idx = find(strcmp(src.Items, val));
        
        fplot(zfunctionAxes, zfunctions{idx}, [0, 10]);
        grid(zfunctionAxes, 'on');              
    end

    function yUpdatePlot(src, ~)
        val = src.Value;
        idx = find(strcmp(src.Items, val));
        
        fplot(yfunctionAxes, yfunctions{idx}, [0, 10]);
        grid(yfunctionAxes, 'on');              
    end

    function resetPlot(~, ~)
        cla(xfunctionAxes);
        fplot(xfunctionAxes, xInitial, [-5, 5]);
        ylim(xfunctionAxes, [-10, 5]);
        grid(xfunctionAxes, 'on');
        firstDropdown.Value = "x(t)";
    end
    function zResetPlot(~, ~)
        cla(zfunctionAxes);
        fplot(zfunctionAxes, zInitial, [0, 10]);
        grid(zfunctionAxes, 'on');
        zSecondDropdown.Value = "x(t)";
    end
    function yResetPlot(~, ~)
        cla(yfunctionAxes);
        fplot(yfunctionAxes, yInitial, [0, 10]);
        grid(yfunctionAxes, 'on');
        ySecondDropdown.Value = "x(t)";
    end
    
end
