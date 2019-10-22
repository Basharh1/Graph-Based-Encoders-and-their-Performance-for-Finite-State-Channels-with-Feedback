% The inputs are CARD and FSC (which contain p - a vector of channel parameters).
% The outputs are:
% 1) Ch_Mat - the channel model in the form of a matrix which corresponds to [S,X,Y]
% 2) Conditional - and already has size of the general joint

function [Ch_Mat,CARD] = Create_Channel(CARD,FSC)

p = FSC.Ch_para;
Ch_Mat = zeros(CARD.s,CARD.x,CARD.y);

if strcmp(FSC.channel,'BEC')
    % Binary erasure Ch_Mat
    Ch_Mat(:,1,1) = 1 - p;
    Ch_Mat(:,2,2) = 1 - p;
    Ch_Mat(:,1,3) = p;
    Ch_Mat(:,2,3) = p;
    
elseif strcmp(FSC.channel,'BSC')
    % Binary symmetric Ch_Mat
    Ch_Mat(:,1,1) = 1 - p;
    Ch_Mat(:,2,2) = 1 - p;
    Ch_Mat(:,1,2) = p;
    Ch_Mat(:,2,1) = p;
    
elseif strcmp(FSC.channel,'ZS')
    % Trapdoor Ch_Mat / Ising Ch_Mat
    % First state is Z-Ch_Mat and second state is S-Ch_Mat
    Ch_Mat(1,1,1) = 1;
    Ch_Mat(1,2,1) = p;
    Ch_Mat(1,2,2) = 1 - p;
    Ch_Mat(2,1,1) = 1 - p;
    Ch_Mat(2,1,2) = p;
    Ch_Mat(2,2,2) = 1;

elseif strcmp(FSC.channel,'Pilot')
    % Pilot Ch_Mat
    Ch_Mat(1,1,1) = 1-p(1);
    Ch_Mat(1,2,1) = p(1);
    Ch_Mat(1,3,1) = 0.5;
    
    Ch_Mat(1,1,2) = p(1);
    Ch_Mat(1,2,2) = 1-p(1);
    Ch_Mat(1,3,2) = 0.5;
    
    Ch_Mat(2,1,1) = 1-p(2);
    Ch_Mat(2,2,1) = p(2);
    Ch_Mat(2,3,1) = 0.5;
    
    Ch_Mat(2,1,2) = p(2);
    Ch_Mat(2,2,2) = 1-p(2);
    Ch_Mat(2,3,2) = 0.5;
    
elseif strcmp(FSC.channel,'Fading')
    % Fading Ch_Mat: Y = (S*X)XOR N
    Ch_Mat(1,1,1) = 1 - p;
    Ch_Mat(1,1,2) = p;
    Ch_Mat(1,2,1) = 1 - p;
    Ch_Mat(1,2,2) = p;
    Ch_Mat(2,1,1) = 1 - p;
    Ch_Mat(2,1,2) = p;
    Ch_Mat(2,2,1) = p;
    Ch_Mat(2,2,2) = 1 - p;
    
elseif strcmp(FSC.channel,'DEC') % Y -> [-1,0,1,?]
    % Dicode erasure Ch_Mat  
    Ch_Mat(1,1,2) = 1-p;
    Ch_Mat(1,1,4) = p;
    Ch_Mat(1,2,4) = p;
    Ch_Mat(1,2,3) = 1 - p;
    Ch_Mat(2,1,1) = 1-p;
    Ch_Mat(2,1,4) = p;
    Ch_Mat(2,2,4) = p;
    Ch_Mat(2,2,2) = 1 - p;
    
elseif strcmp(FSC.channel,'Z_channel')
    % Z Channel - 1 state
    Ch_Mat(:,1,1) = 1;
    Ch_Mat(:,2,2) = 1 - p;
    Ch_Mat(:,1,2) = 0;
    Ch_Mat(:,2,1) = p;
    
else
    disp('Channel is not defined');
    return
end