% ........................................................................

% % My template Matlab codes for binary Logistic Regression for nonlinear
% classification
% Algorithm: fminunc (quasi-Newton)
% plotDecisionBoundary.m
% Navid Salami Pargoo
% 2020

% ........................................................................

% plotDecisionBoundary(theta, X, y, n, upToOrder) plots the data points in a 
% new figure with the decision boundry defined by theta.

function plotDecisionBoundary(theta, X, y, n, upToOrder)

if n == 1
    % Find Indices of Positive and Negative Examples
    pos = find(y == 1); 
    neg = find(y == 0);
    
    % Plot Examples
    figure;
    hold on;
    plot(X(pos, 2), ones(length(pos), 1), 'k+','LineWidth', 2, 'MarkerSize', 7);
    plot(X(neg, 2), zeros(length(neg), 1), 'ko','MarkerFaceColor', 'y', 'MarkerSize', 7);
    
    % Only need 2 points to define a line, so choose two endpoints along
    % with some margin
    plot_x = [min(X(:,2))-0.05*abs(min(X(:,2))),  max(X(:,2))+0.05*abs(max(X(:,2)))];
    % Calculate the decision boundary line
    plot_y = zeros(1,2);
    plot_y(1) = mapFeature(plot_x(1), upToOrder)*theta;
    plot_y(2) = mapFeature(plot_x(2), upToOrder)*theta;
    % Plot
    plot(plot_x, plot_y);  
    ylim([-1, 2])
    
    % Labels and Legend
    xlabel('Feature 1');
    ylabel('Feature 2');
    legend('Positive', 'Negative', 'Decision Boundary');    % Specified in plot order
    hold off;
    
    
elseif n == 2
    % Find Indices of Positive and Negative Examples
    pos = find(y == 1); 
    neg = find(y == 0);

    % Plot Examples
    figure;
    hold on;
    plot(X(pos, 2), X(pos, 3), 'k+','LineWidth', 2, 'MarkerSize', 7);
    plot(X(neg, 2), X(neg, 3), 'ko', 'MarkerFaceColor', 'y','MarkerSize', 7);
   
    u = linspace(min(X(:,2)), max(X(:,2)), 100); 
    v = linspace(min(X(:,3)), max(X(:,3)), 100); 
    z = zeros(length(u), length(v)); 
   
    for i = 1:length(u)
       for j = 1:length(v)
           a=[u(i) v(j)];
           z(i,j) = mapFeature(a, upToOrder)*theta;
       end
    end
    
    % Contour
    z = z';
    contour(u, v, z, [0, 0], 'LineWidth', 2)
    hold off;
   
    % Labels and Legend
    xlabel('Feature 1');
    ylabel('Feature 2');
    legend('Positive', 'Negative', 'Decision Boundry');    % Specified in plot order

elseif n == 3
    % Find Indices of Positive and Negative Examples
    pos = find(y == 1); 
    neg = find(y == 0);

    % Plot Examples
    figure;
    hold on;
    scatter3(X(pos, 2), X(pos, 3), X(pos, 4), 'k+','LineWidth', 2);
    scatter3(X(neg, 2), X(neg, 3), X(neg, 4), 'ko', 'MarkerFaceColor', 'y');
    
    u = linspace(min(X(:,2)), max(X(:,2)), 50); 
    v = linspace(min(X(:,3)), max(X(:,3)), 50); 
    w = linspace(min(X(:,4)), max(X(:,4)), 50); 
    z = zeros(length(u), length(v), length(w)); 

    for i = 1:length(u)
       for j = 1:length(v)
           for k = 1:length(w)
           a=[u(i) v(j) w(k)];
           z(i,j,k) = mapFeature(a, upToOrder)*theta;
           end
       end
    end
    
    % Contour
    contourslice(u, v, w, z, [min(u), max(u)], [min(v), max(v)], [min(w), max(w)], [0, 0])
    view(3)
    hold off;
   
    % Labels and Legend
    xlabel('Feature 1');
    ylabel('Feature 2');
    zlabel('Feature 3');
    legend('Positive', 'Negative', 'Decision Boundry');    % Specified in plot order
    
end
