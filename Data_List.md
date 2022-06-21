# Task 1: Joint Angles to End Position
## Data 1
Input:
> angle1 = deg2rad(0);  
> angle2 = deg2rad(0);  
> angle3 = deg2rad(0);

Output:
> x = 1505;  
> y = 0;  
> z = 1436;  

Adams ：
> x = 1505;  
> y = 0;  
> z = 1471;  
>
## Data 2
Input:
> angle1 = deg2rad(30);  
> angle2 = deg2rad(30);  
> angle3 = deg2rad(30);  

Output:
> x = 1593.6;  
> y = 920.088;  
> z = 796.894;
> 
Adams ：
> x = 1587;  
> y = 911.4;  
> z = 816.5;
## Data 3
Input:
> angle1 = deg2rad(60);  
> angle2 = deg2rad(60);  
> angle3 = deg2rad(60);  

Output:
> x = 905.4470;  
> y = 1568.3;  
> z = 75.824;

Adams ：
> x = 1548;  
> y = 902.0;  
> z = 102.0;

# Task 2: Forward Jacobian
## Data 1
Input:
> angle1 = deg2rad(0);  
> angle2 = deg2rad(0);  
> angle3 = deg2rad(0);  
> angle1dot = deg2rad(0);  
> angle2dot = deg2rad(0);  
> angle3dot = deg2rad(0);  

Output:
> xdot = 0;  
> ydot = 0;  
> zdot = 0;  

Adams ：  
> xdot = 0;  
> ydot = 0;  
> zdot = 0;  

## Data 2
Input:
> angle1 = deg2rad(30);  
> angle2 = deg2rad(30);  
> angle3 = deg2rad(30);  
> angle1dot = deg2rad(30);  
> angle2dot = deg2rad(30);  
> angle3dot = deg2rad(30);  

Output:
> xdot = -343.0494;  
> ydot = 914.5104;  
> zdot = -712.1865; 

Adams ：  
> x = -410.0;  
> y = 815.2;  
> z = -784.1;  

## Data 3
Input:
> angle1 = deg2rad(30);  
> angle2 = deg2rad(30);  
> angle3 = deg2rad(30);  
> angle1dot = deg2rad(60);  
> angle2dot = deg2rad(60);  
> angle3dot = deg2rad(60);  

Output:
> xdot = -1859.7;  
> ydot = 571.6589;  
> zdot = -1393.37;  

Adams ：
> x = -1727;  
> y = 290.2;  
> z = -857.0;

# Task 3
## Data 1
Input:
> angle1 = deg2rad(30);  
> angle2 = deg2rad(30);  
> angle3 = deg2rad(30);  
> fx = 50;  
> fy = 50;  
> fz = 50;  

Output:
> tau1 = 33678;  
> tau2 = 181300;  
> tau3 = -13841;

Adams ：
> tau1 = 41520;  
> tau2 = 238600;  
> tau3 = -13180;

## Data 2
Input:
> angle1 = deg2rad(30);  
> angle2 = deg2rad(30);  
> angle3 = deg2rad(30);  
> fx = 100;  
> fy = 100;  
> fz = 100;  

Output:
> tau1 = 67355;  
> tau2 = 213570;  
> tau3 = -93229;

Adams ：
> tau1 = 116100;  
> tau2 = 104300;  
> tau3 = -160900;

## Data 3
Input:
> angle1 = deg2rad(30);  
> angle2 = deg2rad(30);  
> angle3 = deg2rad(30);  
> fx = 300;  
> fy = 300;  
> fz = 300;  

Output:
> tau1 = 202070;  
> tau2 = 342660;  
> tau3 = -410780;

Adams:
> tau1 = 415400;  
> tau2 = 120300;  
> tau3 = -365900;
# Task 4

# Task 5