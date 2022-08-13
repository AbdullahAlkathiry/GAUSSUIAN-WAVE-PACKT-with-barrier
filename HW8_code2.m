dx=1/40;
dt=1/20000;
x=0:dx:20;
t=0:dt:15;
psi = exp(20*1i*x-(x-4).^2);
n = length(psi);
k=0;
p=[];
for j = 1:length(t)
 d2psi = (psi(1:n-2)+psi(3:n)-2*psi(2:n-1))/dx^2;
 d2psi =[0 d2psi 0];
 psi = 1i*d2psi*dt+psi;
 A = sum(abs(psi).^2)*dx;
 psi = psi/sqrt(A);
 
 k=k+1;
 if(k==200)
 p=[p;psi];
 k=0;
 end
end
for j=1:size(p,1)   
 plot(x,abs(p(j,:)).^2)
 text(15.5,0.6,"t= "+ t(j*200))
 ylim([0 0.8])
 pause(0.01)
end
%%
dx=1/40;
dt=1/20000;
x=0:dx:20;
t=0:dt:20;
psi = exp(20*1i*x-(x-4).^2);
n = length(psi);V=400*(heaviside(x-9.5)-heaviside(x-10.5));
k=0;
p=[];
a=20;
m=1;
for j = 1:length(t)
 d2psi = (psi(1:n-2)+psi(3:n)+2*psi(2:n-1))/dx^2;
 d2psi =[0 d2psi 0];
 psi = -1i*(-d2psi+V.*psi)*dt+psi;
 A = sum(abs(psi).^2)*dx;
 psi = psi/sqrt(A);
 k=k+1;
 if(t(j)<0.4&&k==20)
 p=[p;psi];
 k=0;
 elseif(k==a)
      p=[p;psi];
      a=a+1
    k=0;
 end
end
for j=1:size(p,1)   
 plot(x,abs(p(j,:)).^2,x,V)
 text(15.5,0.6,"t= "+ t(j*2))
 ylim([0 0.95])
 pause(0.01)
end