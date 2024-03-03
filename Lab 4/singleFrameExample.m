clc;
clear all;
close all;

%Include source files in path
addpath(genpath('../src'))

%Initialization Parameters
server_ip   = '127.0.0.1';     %IP address of the Unity Server
server_port = 55001;           %Server Port of the Unity Sever

client = tcpclient(server_ip,server_port);
fprintf(1,"Connected to server\n");

depth = 1.25
% x(in out),y(left right),z(up down),yaw[z],pitch[y],roll[x]
pose = [depth,-0.03,0,0,0,0];
unityImageLeft = unityLink(client,pose);
%figure out why the image is squished
subplot(1,4,1)
imshow(unityImageLeft);

Frame_1 = unityImageLeft
formated_frame_1 = rgb2gray(Frame_1);
colormap gray
imagesc(formated_frame_1)

subplot(1,4,3)
imshow(formated_frame_1)
[center, radius] = imfindcircles(formated_frame_1,[25 75],"Sensitivity",0.85)
hold on
viscircles(center, radius, 'Color', 'red')
scatter(center(1), center(2))

pose = [depth,0.03,0,0,0,0];
unityImageRight = unityLink(client,pose);
%
subplot(1,4,2)
imshow(unityImageRight);

Frame_2 = unityImageRight
formated_frame_2 = rgb2gray(Frame_2);
colormap gray
imagesc(formated_frame_2)

subplot(1,4,4)
imshow(formated_frame_2)
[center, radius] = imfindcircles(formated_frame_2,[25 75],"Sensitivity",0.85)
hold on
viscircles(center, radius, 'Color', 'red')
scatter(center(1), center(2))

%Close Gracefully
fprintf(1,"Disconnected from server\n");
