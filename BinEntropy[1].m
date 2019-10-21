function Y = BinEntropy(X)
    if X==1 || X==0 || X>1 || X<0
        Y=0;
    return
    else
        Y= -X*log2(X)-(1-X)*log2(1-X);
    end
end
