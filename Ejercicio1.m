
main()
function main()
    mainPanel = uifigure("Name","Ejercicio 1");
    mainGridLayout = uigridlayout(mainPanel, [1, 1]);
    tabContainer = uitabgroup(mainGridLayout);
    firstTab = uitab(tabContainer,"Title","Inciso A");
    firstTabGridLayout = uigridlayout(firstTab, [1,1]);
    yfunctionAxes = uiaxes(firstTabGridLayout);
    yfunction = @(t) 2 - 2 * (t.^2); 
    fplot(yfunctionAxes, yfunction, [-5, 5]);
    ylim(yfunctionAxes, [-20, 5]); 
    grid(yfunctionAxes, 'on');

    secondTab = uitab(tabContainer,"Title","Inciso B");
    secondTabGridLayout = uigridlayout(secondTab, [2, 2]);
    spinnersGridLayout = uigridlayout(secondTabGridLayout, [6, 1]);
    %amplitudeSpinner = uispinner(secondTabGridLayout,"Limits",[0 10], "Value", 1, "ValueChangedFcn", @(amplitudeSpinner,event) updateZFunction(amplitudeSpinner, event, zFunctionAxes));
    amplitudeLabel = uilabel(spinnersGridLayout,"Text","Amplitud");
    amplitudeSpinner = uispinner(spinnersGridLayout,"Limits",[0 10], "Value", 1);
    frecuencyLabel = uilabel(spinnersGridLayout,"Text","Frecuencia");
    frecuencySpinner = uispinner(spinnersGridLayout,"Limits",[0 10], "Value", 1);
    phaseLabel = uilabel(spinnersGridLayout,"Text","Fase");
    phaseSpinner = uispinner(spinnersGridLayout,"Limits",[0 2*pi], "Value", 1);
    zFunctionAxes = uiaxes(secondTabGridLayout); 
    A = 1;
    w = 1;
    theta = pi/4;        
    zfunction = @(t) (A * sin(w * t + theta));
    fplot(zFunctionAxes, zfunction, [0, 10]);
    grid(zFunctionAxes, 'on');

    

    amplitudeSpinner.ValueChangedFcn = @(src, event) updatePlot(src, event, amplitudeSpinner, frecuencySpinner, phaseSpinner, zFunctionAxes);
    frecuencySpinner.ValueChangedFcn = @(src, event) updatePlot(src, event, amplitudeSpinner, frecuencySpinner, phaseSpinner, zFunctionAxes);
    phaseSpinner.ValueChangedFcn = @(src, event) updatePlot(src, event, amplitudeSpinner, frecuencySpinner, phaseSpinner, zFunctionAxes);

end

function updatePlot(~, ~, amplitudeSpinner, frecuencySpinner, phaseSpinner, zFunctionAxes)
    A = amplitudeSpinner.Value;
    w = frecuencySpinner.Value;
    theta = phaseSpinner.Value;
    zfunction = @(t) (A * sin(w * t + theta));
    cla(zFunctionAxes); 
    fplot(zFunctionAxes, zfunction, [0, 10]);
    grid(zFunctionAxes, 'on');
    end
