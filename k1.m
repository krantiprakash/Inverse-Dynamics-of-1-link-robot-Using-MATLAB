% Kranti Prakash
% M23IRM006


clear all 
clc 


%initial constraint
m= 1;
l=1;
lc=0.5;
Izz= (1/3)*m*l^2;
g=9.81;

%initial parameter
theta1= 0;
theta2= (2*pi)/3;
T1= 0;
T2= 3;
T=3;
time = 0:0.01:T
for i =1:length(time)
    t=time(i);
    theta(i) = theta1 +((theta2-theta1)/T)*(t-(T/(2*pi)*sin((2*pi*t)/T)));
    theta_dot(i) = ((theta2-theta1)/T)*(1-cos((2*pi*t)/T));
    theta_dot_dot(i) = ((theta2-theta1)/T)*((2*pi)/T)*sin((2*pi*t)/T);
    tau(i)= Izz*theta_dot_dot(i) + m*g*lc*cos(theta(i));
    x(i) = cos(theta(i));
    y(i) = sin(theta(i));
    figure(1)
    plot([0,x(i)],[0,y(i)])
    axis equal
    axis([-2 2 -2 2])
    pause(0.01)
    
end
figure(2)
plot(time,theta,time,theta_dot,time,theta_dot_dot)
title("variation of position ,velocity,acceleration w.r.t time")
xlabel("time")
ylabel("position,velocity,acceleration")
grid on 
figure(3)
plot(time,theta)
title("variation of position vs time")
xlabel("time")
ylabel("position")
grid on 
figure(4)
plot(time,theta_dot)
title("variation of velocity vs time")
xlabel("time")
ylabel("velocity")
grid on 
figure(5)
plot(time,theta_dot_dot)
title("variation of accleration vs time")
xlabel("time")
ylabel("acceleration")
grid on 