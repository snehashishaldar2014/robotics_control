clear all % clears all variables and functions
clc % clears the command window and homes the cursor
close all % closes all the open figure windows
 syms xCsol yC xB yB BC
AB=0.5; BC=1.;
phi=pi/4;

xA=0; yA=0;

xB=AB*cos(phi);
yB=AB*sin(phi);

yC=0;

eqnC = (xB - xCsol)^2 + (yB - yC)^2 == BC^2;

% Solve for xCsol
solC = solve(eqnC, xCsol);

xC1=eval(solC(1));
xC2=eval(solC(2));

if xC1 > xB 
    xC = xC1; 
else 
    xC = xC2; 
end

phi2 = atan((yB-yC)/(xB-xC));

fprintf('xB = %g (m) \n', xB)
fprintf('yB = %g (m) \n', yB)
fprintf('xC = %g (m) \n', xC)
fprintf('yC = %g (m) \n', yC)
fprintf('phi2 = %g (degrees) \n', phi2*180/pi)

% Graphic of the mechanism
plot([xA,xB],[yA,yB],'r-o',...
[xB,xC],[yB,yC],'b-o'),...
xlabel('x (m)'),...
ylabel('y (m)'),...
title('positions for \phi = 45 (deg)'),...
text(xA,yA,' A'),...
text(xB,yB,' B'),...
text(xC,yC,' C'),...
axis([-0.2 1.4 -0.2 1.4]),...
grid
% the commas and ellipses (...) after the commands
% were used to execute the commands together
% end of program
