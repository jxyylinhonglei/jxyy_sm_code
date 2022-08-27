function [fitresult, gof] = createFit(temp1, temp2)
%CREATEFIT(TEMP1,TEMP2)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : temp1
%      Y Output: temp2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 15-Jul-2022 16:43:01 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( temp1, temp2 );

% Set up fittype and options.
ft = fittype( 'weibull' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [0 0];
opts.StartPoint = [0.386362523157113 0.250449079276038];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, '风速频率', '威布尔分布', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( '风速(m/s)', 'Interpreter', 'none' );
ylabel( '频率', 'Interpreter', 'none' );
grid on




