% Define the objective function coefficients (all 1's)
function [x, fval, exitflag] = solveIntegerLP(b)
    f = ones(11, 1);
    
    A = [
        1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1;
        1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1;
        1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1;
        1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0;
        1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0;
        0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1;
        0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1;
    ];
    
    lb = 0.01 * ones(10, 1);
    ub = [];
    
    [x, fval, exitflag] = intlinprog(f, 1:11, -A, -b, [], [], lb, ub);
    
    % Display results
    if exitflag == 1
        disp('Optimal solution found:');
        disp('Variables:');
        disp(x);
        disp('Objective value:');
        disp(fval);
    else
        disp('No optimal solution found.');
    end
end

% solveIntegerLP([50, 75, 75, 70, 65, 50, 40]);
solveIntegerLP([50, 75, 75, 55, 65, 50, 55]);
