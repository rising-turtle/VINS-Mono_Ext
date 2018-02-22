%% create a number of features by distributing around area [x, y] on plane z

function vfeats = createFeatureHorizontal(x, y, z)

    vfeats = []; 
    id = 1;
    for i=1:length(x)
        for j = 1:length(y)
            feature.x = x(i);
            feature.y = y(j); 
            feature.z = z;
            feature.id = id; 
            id = id + 1;
            vfeats = [vfeats; feature];
        end
    end
    

end