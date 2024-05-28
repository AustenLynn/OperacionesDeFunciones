
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
    
    firstSpinnersGrid = uigridlayout(secondTabGridLayout, [6, 1]);
    amplitudeLabel = uilabel(firstSpinnersGrid,"Text","Amplitud");
    amplitudeSpinner = uispinner(firstSpinnersGrid,"Limits",[0 10], "Value", 1);
    frecuencyLabel = uilabel(firstSpinnersGrid,"Text","Frecuencia");
    frecuencySpinner = uispinner(firstSpinnersGrid,"Limits",[0 10], "Value", 1);
    phaseLabel = uilabel(firstSpinnersGrid,"Text","Fase");
    phaseSpinner = uispinner(firstSpinnersGrid,"Limits",[0 2*pi], "Value", 1);
    zFunctionAxes = uiaxes(secondTabGridLayout); 
    A = 1;
    w = 1;
    theta = pi;        
    zfunction = @(t) (A * sin(w * t + theta));
    fplot(zFunctionAxes, zfunction, [0, 10]);
    grid(zFunctionAxes, 'on');

    secondSpinnersGrid = uigridlayout(secondTabGridLayout, [6, 1]);
    secondAmplitudeLabel = uilabel(secondSpinnersGrid,"Text","Amplitud");
    secondAmplitudeSpinner = uispinner(secondSpinnersGrid,"Limits",[0 10], "Value", 1);
    secondFrecuencyLabel = uilabel(secondSpinnersGrid,"Text","Frecuencia");
    secondFrecuencySpinner = uispinner(secondSpinnersGrid,"Limits",[0 10], "Value", 1);
    secondPhaseLabel = uilabel(secondSpinnersGrid,"Text","Fase");
    secondPhaseSpinner = uispinner(secondSpinnersGrid,"Limits",[0 2*pi], "Value", 1);
    yFunctionAxes = uiaxes(secondTabGridLayout); 
    B = 1;
    f = 1;
    thetaa = pi;        
    yfunction = @(t) (B * cos((f * 2 * pi * t) + thetaa));
    fplot(yFunctionAxes, yfunction, [0, 10]);
    grid(yFunctionAxes, 'on');

    amplitudeSpinner.ValueChangedFcn = @(src, event) updateFirstPlot(src, event, amplitudeSpinner, frecuencySpinner, phaseSpinner, zFunctionAxes);
    frecuencySpinner.ValueChangedFcn = @(src, event) updateFirstPlot(src, event, amplitudeSpinner, frecuencySpinner, phaseSpinner, zFunctionAxes);
    phaseSpinner.ValueChangedFcn = @(src, event) updateFirstPlot(src, event, amplitudeSpinner, frecuencySpinner, phaseSpinner, zFunctionAxes);

    secondAmplitudeSpinner.ValueChangedFcn = @(src, event) updateSecondPlot(src, event, secondAmplitudeSpinner, secondFrecuencySpinner, phaseSpinner, yFunctionAxes);
    secondFrecuencySpinner.ValueChangedFcn = @(src, event) updateSecondPlot(src, event, secondAmplitudeSpinner, secondFrecuencySpinner, phaseSpinner, yFunctionAxes);
    secondPhaseSpinner.ValueChangedFcn = @(src, event) updateSecondPlot(src, event, secondAmplitudeSpinner, secondFrecuencySpinner, phaseSpinner, yFunctionAxes);
end

function updateFirstPlot(~, ~, amplitudeSpinner, frecuencySpinner, phaseSpinner, zFunctionAxes)
    A = amplitudeSpinner.Value;
    w = frecuencySpinner.Value;
    theta = phaseSpinner.Value;
    zfunction = @(t) (A * sin(w * t + theta));
    cla(zFunctionAxes); 
    fplot(zFunctionAxes, zfunction, [0, 10]);
    grid(zFunctionAxes, 'on');
    end

function updateSecondPlot(~, ~, amplitudeSpinner, frecuencySpinner, phaseSpinner, yFunctionAxes)
    B = amplitudeSpinner.Value;
    f = frecuencySpinner.Value;
    thetaa = phaseSpinner.Value;
    yfunction = @(t) (B * cos((f * 2 * pi * t) + thetaa));
    cla(yFunctionAxes); 
    fplot(yFunctionAxes, yfunction, [0, 10]);
    grid(yFunctionAxes, 'on');
    end