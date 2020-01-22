% If using this code for research or industrial purposes, please cite:

% G. Papazafeiropoulos, M. Muñiz-Calvente, E. Martínez-Pañeda. Abaqus2Matlab: a suitable tool for finite element post-processing.
% Advances in Engineering Software. Vol. 105, March 2017, Pages 9-16.
% DOI:10.1016/j.advengsoft.2017.01.006

% % G. Papazafeiropoulos, M. Muñiz Calvente, E. Martinez-Pañeda
% % % miguelmunizcalvente@gmail.com

close all
clear variables 
close all

%% 1st STEP - Run one FEM model

disp('Simulation Started')
Inp_file='name_ of_the_input_file';
%make a folder to run the actual .inp file
         [s, mess, messid]=mkdir(Inp_file);
         copyfile([Inp_file '.inp'],[pwd '\' Inp_file '\'])
         oldFolder = cd(Inp_file);

% Run the input file with Abaqus
system(['abaqus job=' Inp_file]);

% Pause Matlab execution to give Abaqus enough time to create the lck file
pause(10)

% If the lck file exists then halt Matlab execution
while exist([Inp_file '.lck'],'file')==2
  pause(0.1)
end
disp('Simulation Finished')

%% 2st STEP - Postprocess Abaqus results file with Abaqus2Matlab
% Assign all lines of the fil file in an one-row string (after Abaqus
% analysis terminates)
disp('Reading .fil')
Rec = Fil2str([Inp_file '.fil']);


% Obtain the desired output data
disp('Obtaining desired output data')
out = RecXXX(Rec); % Put here the Rec function selected
