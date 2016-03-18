function distribution = getBadugiDistributionWithoutPermutations(numCards)
% Input: 3-dimensional handMatrix containing all possible permutations of hands
% in the form handMatrix(hand, card, rank=1 or suit=2), and numCards in one hand
% Output: distribution of different badugis

distribution = zeros(1, numCards);

[handMatrix, n] = getAllHandsWithoutPermutations(numCards);

for hand = 1:n
  degree = isBadugi(handMatrix(hand,:,1), handMatrix(hand,:,2), numCards);
  distribution(degree) = distribution(degree) + 1;
end

% Prinitng the distribution to terminal
for d = 1:numCards % degrees of badugi
  percent = 100*distribution(d)/n;
  fprintf('Number of degree %i badugis: %i (%i%s)\n', d, distribution(d), percent, '%')
end

end
