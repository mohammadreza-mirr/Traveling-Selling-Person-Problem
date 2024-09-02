function tour2=CreateNeighbor(tour1)

    pSwap=0.2;
    pReversion=0.5;
    pInsertion=1-pSwap-pReversion;
    
    p=[pSwap pReversion pInsertion];
    
    METHOD=RouletteWheelSelection(p);
    
    switch METHOD
        case 1
           
            tour2=ApplySwap(tour1);
            
        case 2
           
            tour2=ApplyReversion(tour1);
            
        case 3
           
            tour2=ApplyInsertion(tour1);
            
    end

end