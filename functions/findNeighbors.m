function [ neighbor_vector ] = findNeighbors( conn, idx )
%FINDNEIGHBORS find all neighboring points based on connectivity index conn
%     conn - connectivity index
%     idx - desired index point

[r,~] = find(conn == idx);
indeces = conn(r,:);
indeces = indeces(:);
important_ones = indeces(indeces ~= idx);
neighbor_vector = unique(important_ones);

end

