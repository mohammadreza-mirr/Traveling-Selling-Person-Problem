function L=TourLength(tour,model)

    n=length(tour);
    
    tour=[tour tour(1)];
    
    L=0;
    
    for k=1:n
        
        i=tour(k);
        j=tour(k+1);
        
        L=L+model.d(i,j);
        
    end

end