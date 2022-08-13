dx = 0.015;
dt = 0.000004;
s  = dt/(dx^2);
x = 0:dx:20;
n =length(x);
t = 0:dt:0.5;
psi = exp(20*1i*x-(x-4).^2).';
 A = sum(abs(psi).^2)*dx;
 psi = psi/sqrt(A);
 V=400*(heaviside(x-9.9)-heaviside(x-10.1));
 V=diag(V);% in part 1 V=0;
U_1 = diag((1+2i*s)*ones([1,n]));
U_1 = U_1 + 1i*dt*V;
for j=1:n-1
    U_1(j,j+1)= -1i*s;
    U_1(j+1,j)= -1i*s;
end
U=inv(U_1);
p = [psi];
k=0;
for j=1:length(t)
   psi=U*psi;
   A = sum(abs(psi).^2)*dx;
 psi = psi/sqrt(A);
   k=k+1;
   if(k==500)
       p=[p,psi];
       k=0;
   end
end
for j=1:size(p,2)-1
  tv(j)=t(500*j);
  R(j)=sum(abs(p(1:660,j)).^2)*dx;
  T(j)=sum(abs(p(675:1334,j)).^2)*dx;
 plot(x,abs(p(:,j)).^2);ylim([0 0.85])
 title("|\psi|^2")
 pause(0.01)
end
figure
plot(tv,R,tv,T,tv,T+R)
legend("R","T","R+T")
xlabel("time")
