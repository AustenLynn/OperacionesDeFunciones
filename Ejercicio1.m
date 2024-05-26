
main()
function main()
    mainContainer = uifigure;
    gridLayout = uigridlayout(mainContainer, [1, 1]);
    tabContainer = uitabgroup(gridLayout);
    firstTab = uitab(tabContainer,"Title","Inciso A");
    secondTab = uitab(tabContainer,"Title","Inciso B"); 
       


    A = 1;
    w = 1;
    theta = pi/4; 
    z = @(t) A + sin(w * t + theta);
    %fplot(z, [0, 10]);

end

function ola()
grid on
end
