function [ A_c,ind] = LCC(A )
% Find the largest weakly connected component of a network
%
%   Input:
%       A: adjacency matrix
%
%   Outputs:
%       A_c: adjacency matrix of largest connected component
%       ind: node indeces of nodes in the largest connected component, i.e.
%           A(ind,ind)=A_c
%
% This function relies on the MatlabBgl library:
%   http://www.mathworks.co.uk/matlabcentral/fileexchange/10922-matlabbgl
%
% see also components

% Version: 2.0.2
% Date: Wed 20 Jun 2018 16:01:02 CEST
% Author: Lucas Jeub
% Email: lucasjeub@gmail.com

if iscell(A)
    At=AggregateNetwork(A);
    [C,sizes]=components(max(At,At'));
    [~,k]=max(sizes);
    ind=find(C==k);
    A_c=cell(size(A));
    for i=1:numel(A)
        A_c{i}=A{i}(ind,ind);
    end
else

    [C,sizes]=components(max(A,A'));

    [~,k]=max(sizes);
    ind=find(C==k);

    A_c=A(ind,ind);
end

end

