% k/c
kc = 0.3;
nx = 4;
ny = 4;
% the estimated temprature values
dx = 1;
dy = 1;
% the time subinterval length
dt = 1;
% number of iterations
N = 10;
% set non-zero Dirichlet b.c.
T(1,4) = 100;
T(2,4) = 100;
T(3,4) = 100;
T(4,4) = 100;
%surf draws the graph, note the transpose
surf(T')
colorbar
pause(.5)
% step through time
for n=1:N
    % compute temp for all interior points
    Tn = T;
    for i=2:nx-1
        for j=2:ny-1
            T(i,j) = Tn(i,j) +(dt/dx^2)kc(Tn(i+1,j) + Tn(i-1,j) + Tn(i,j+1) + Tn(i,j-1) - 4*Tn(i,j));
        end
    end
    % enforce Neumann b.c.
    T(1,2) = T(2,2);
    T(1,3) = T(2,3);
    T(4,2) = T(3,2);
    T(4,3) = T(3,3);
    surf(T')
    colorbar
    pause(.5)
end