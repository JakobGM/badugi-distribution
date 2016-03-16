function degree = isBadugi(ranks, suits, numCards)
% Takes in numCards ranks(1-13) in a vector and numCards suits(1-4) in a vector
% Returns the degree of the badugi

degree = 1; %fist card can't collide
for i = 2:numCards
  if( (sum(ranks(1:(i-1)) == ranks(i)) + sum(suits(1:(i-1)) == suits(i))) == 0 )
    degree = degree + 1;
  end
end
