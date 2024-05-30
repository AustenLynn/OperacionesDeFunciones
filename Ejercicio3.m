main()

function main()
    mainPanel = uifigure("Name", "Ejercicio 3");
    mainGridLayout = uigridlayout(mainPanel, [5, 3]);
    even = uilabel(mainGridLayout, "Text", "Par");
    even.HorizontalAlignment = 'center';
    even.FontSize = 24;
    even.FontWeight = 'bold';

    initialPlotAxes = uiaxes(mainGridLayout);
    title(initialPlotAxes, "Funcion Inicial"); 
    odd = uilabel(mainGridLayout, "Text", "Impar");    
    odd.HorizontalAlignment = 'center';
    odd.FontSize = 24;
    odd.FontWeight = 'bold';

    xInitial = @(t) 2 - 2 * (t.^2);
    
    fplot(initialPlotAxes, xInitial, [-5, 5]);
    ylim(initialPlotAxes, [0, 5]);
    grid(initialPlotAxes, 'on');
    hold(initialPlotAxes, 'on');

    halfAmplituedEven = uiaxes(mainGridLayout);
    title(halfAmplituedEven, "0.5x(t)");
    fplot(halfAmplituedEven, @(t) 0.5 * xInitial(t), [-5, 5]);
    ylim(halfAmplituedEven, [0, 5]);
    grid(halfAmplituedEven, 'on');


    halfAmplituedOdd = uiaxes(mainGridLayout);
    title(halfAmplituedOdd, "0.5x(t)");
    halfAmplituedOdd.Layout.Row = 2;
    halfAmplituedOdd.Layout.Column = 3;
    fplot(halfAmplituedOdd, @(t) 0.5 * xInitial(t), [-5, 5]);
    ylim(halfAmplituedOdd, [0, 5]);
    grid(halfAmplituedOdd, 'on');

    
    negativeHalfAmplituedEven = uiaxes(mainGridLayout);
    title(negativeHalfAmplituedEven, "0.5x(-t)");
    negativeHalfAmplituedEven.Layout.Row = 3;
    negativeHalfAmplituedEven.Layout.Column = 1;
    fplot(negativeHalfAmplituedEven, @(t) 0.5 * xInitial(-t), [-5, 5]);
    ylim(negativeHalfAmplituedEven, [0, 5]);
    grid(negativeHalfAmplituedEven, 'on');


    negativeHalfAmplituedOdd = uiaxes(mainGridLayout);
    title(negativeHalfAmplituedOdd, "0.5x(-t)");
    negativeHalfAmplituedOdd.Layout.Row = 3;
    negativeHalfAmplituedOdd.Layout.Column = 3;
    fplot(negativeHalfAmplituedOdd, @(t) 0.5 * xInitial(-t), [-5, 5]);
    ylim(negativeHalfAmplituedOdd, [0, 5]);
    grid(negativeHalfAmplituedOdd, 'on');

    pairSum = uiaxes(mainGridLayout);
    title(pairSum, "Par x(t)");
    pairSum.Layout.Row = 4;
    pairSum.Layout.Column = 1;

    oddSum = uiaxes(mainGridLayout);
    title(oddSum, "Impar x(t)");
    oddSum.Layout.Row = 4;
    oddSum.Layout.Column = 3;

    totalSum = uiaxes(mainGridLayout);
    title(totalSum, " Suma Par Impar x(t");
    totalSum.Layout.Row = 5;
    totalSum.Layout.Column = 2;

    xEven = @(t) 0.5 * (xInitial(t) + xInitial(-t));
    xOdd = @(t) 0.5 * (xInitial(t) - xInitial(-t));

    fplot(pairSum, xEven, [-5, 5]);
    title(pairSum, 'Par x(t)');
    ylim(pairSum, [0, 5]);
    grid(pairSum, 'on');

    fplot(oddSum, xOdd, [-5, 5]);
    title(oddSum, 'Impar x(t)');
    ylim(oddSum, [0, 5]);
    grid(oddSum, 'on');

    totalFunction = @(t) xEven(t) + xOdd(t);
    fplot(totalSum, totalFunction, [-5, 5]);
    title(totalSum, 'Suma  x(t)');
    ylim(totalSum, [0, 5]);
    grid(totalSum, 'on');
end