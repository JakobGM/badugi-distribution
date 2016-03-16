function distribution = getBadugiDistribution(numCards)
% Input: 3-dimensional handMatrix containing all possible permutations of hands
% in the form handMatrix(hand, card, rank=1 or suit=2), and numCards in one hand
% Output: distribution of different badugis

n = factorial(52) / factorial(52 - numCards); % Number of permutations of hands

distribution = zeros(1, numCards);

handMatrix = getAllHands(numCards);

for hand = 1:n
  degree = isBadugi(handMatrix(hand,:,1), handMatrix(hand,:,2), numCards);
  distribution(degree) = distribution(degree) + 1;
end

end
