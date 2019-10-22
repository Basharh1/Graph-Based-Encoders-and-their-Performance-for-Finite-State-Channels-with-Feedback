% Here, the state of the form S^+ = f(s,x,y) is given by a matrix
% The input is C (cardinality) and string 'state' that represents the state evolution for specific examples.
% You can add your own state evaluation function below.

function S = Create_S(CARD,FSC)

% Basic State Matrix - order is (s^-,s^+,x,y)
S = zeros(CARD.s,CARD.s,CARD.x,CARD.y);

if strcmp(FSC.state,'DMC')
    S(1,1,:,:) = 1;
    
elseif strcmp(FSC.state,'S=X')
    % The state is the previous x (Ising)
    for x=1:CARD.x
        S(:,x,x,:) = 1;
    end

elseif strcmp(FSC.state,'S=Y')
    % The state is the previous y (POST)
    S(:,1,:,1) = 1;
    S(:,2,:,2) = 1;
        
elseif strcmp(FSC.state,'XOR(SXY)')
    % S+ = S- XOR X XOR Y (Trapdoor / Fading Type 1)
    S(1,1,1,1) = 1;
    S(1,1,2,2) = 1;
    S(1,2,1,2) = 1;
    S(1,2,2,1) = 1;
    S(2,1,1,2) = 1;
    S(2,1,2,1) = 1;
    S(2,2,1,1) = 1;
    S(2,2,2,2) = 1;

elseif strcmp(FSC.state,'XOR(SX)')
    % S+ = S- XOR X
    S(1,1,1,:) = 1;
    S(1,2,2,:) = 1;
    S(2,2,1,:) = 1;
    S(2,1,2,:) = 1;
    
elseif strcmp(FSC.state,'No_consecutive')
    % No consecutive ones
    S(1,1,1,:) = 1;
    S(1,2,2,:) = 1;
    S(2,1,1,:) = 1;
    
elseif strcmp(FSC.state,'Trapdoor_M')
    % S+ = S + X - Y (Trapdoor with M states)
    M=CARD.s;
    for si=1:M
        for xi=1:2
            for yi=1:2
                Snew = (si-1) + (xi-1) - (yi-1) + 1;
                if (Snew)&&(Snew<M+1)
                    S(si,Snew,xi,yi) = 1;
                end
            end
        end
    end
    
elseif strcmp(FSC.state,'Fading_Type2')
    % S^+ = S^-\XOR N where Y = (X*S) XOR N HARD (Fading Type 2)
    S(1,1,1,1) = 1;
    S(1,2,1,2) = 1;
    S(1,1,2,1) = 1;
    S(1,2,2,2) = 1;
    S(2,2,1,1) = 1;
    S(2,1,1,2) = 1;
    S(2,1,2,1) = 1;
    S(2,2,2,2) = 1;
    
else
    clc
    disp('State function is not defined');
    return
end