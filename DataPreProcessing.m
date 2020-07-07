clc;
clear variables;
close all;
%/*--------------- Data Preprocessing----------------*/
% Importing data from the folders;
train_clean=dir('train/clean/*.png');
train_messy=dir('train/messy/*.png');
%Variables to hold train data;
trainData_clean=zeros(10,268203);
trainData_messy=zeros(10,268203);
% Importing Images from the folders ;
nFiles_clean = length(train_clean);
nFiles_messy = length(train_messy);
for i = 1:nFiles_clean
   filename = train_clean(i).name;
   filename = strcat('train/clean/',filename);
   image = imread(filename);
   image = reshape(image,[1,299*299*3]);
   trainData_clean(i,:)= image;
end
for i = 1:nFiles_messy
   filename = train_messy(i).name;
   filename = strcat('train/messy/',filename);
   image = imread(filename);
   image = reshape(image,[1,299*299*3]);
   trainData_messy(i,:)= image;
end
trainDataX=[trainData_clean;trainData_messy];
trainDataY=zeros(nFiles_clean+nFiles_messy,1);
trainDataY(1:nFiles_clean) = 1;
%/*------- Converting to proper Dimesnions--------*/
trainDataX = trainDataX.'; % (px*px*3,samples)
trainDataY = trainDataY.'; % (1,samples)