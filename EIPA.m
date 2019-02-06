bc = 0;
nx = 50;
ny = 20*nx;
G = sparse(nx*ny,nx*ny); 


for i = 1:nx
    for j = 1:ny
        n = j+(i-1)*ny;
        
        if i == j
            G(n,n) = 1;%diagonal
        elseif i == 1
            G(n,n) = 1;%bottom boudary
        elseif j == 1
            G(n,n) = 1;%left boundary
        elseif i == nx
            G(n,n) = 1;%top boudary
        elseif j == ny
            G(n,n) = 1;%right boundary
        else %rest of matrix
            nxm = j+(i-2)*ny;
            nxp = j+(i)*ny;
            nyp = j+1+(i-1)*ny;
            nym = j-1+(i-1)*ny;
            
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
            G(n,n) = -4;
            
        end
            
     
    end
end

spy(G)
[E,D] = eigs(G,9,'SM');

for i = 1:nx
    for j = 1:ny
         n = j+(i-1)*ny;
         
         Emap(i,j) = E(n,1);
    end
end

surf(Emap)
