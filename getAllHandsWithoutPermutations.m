function [handMatrix, numHands] = getAllHandsWithoutPermutations(numCards)
% Takes in number of cards in one hand and returns all permutations of hands

% Combinatoric parameters
cardsInDeck = 52;
n = factorial(cardsInDeck) / factorial(cardsInDeck - numCards); % Amount of permutations of hands


% cardDeck(card, 1=rank and 2=suit)
cardDeck = zeros(52,2);
cardCounter = 1;

% Generate card deck
for suit = 1:4
  for rank = 1:13
    cardDeck(cardCounter, 1) = rank;
    cardDeck(cardCounter, 2) = suit;
    cardCounter = cardCounter + 1;
  end
end

assert(cardCounter == (cardsInDeck+1))

% Matrix to sotre all hand permutations
global handNumMatrix
handNumMatrix = zeros(n, numCards);
% handCounter = 0;

%%
% handCounter = 0;
% cardsLeft = 1:52;
% cardCounter = 1;
% global cardVector
% cardVector = [];
%
% [cardsLeft handCounter] = numToHandMatrix(cardsLeft, handCounter, cardCounter, numCards);
% assert(handCounter == n)
%%

%%%
cardsLeft = 1:cardsInDeck;
global handNumMatrix
global cardVector
global cardCounter
global handCounter
handNumMatrix = zeros(n, numCards);
cardVector = zeros(1,numCards);
cardCounter = 0;
handCounter = 0;
handNumMatrixGenerator(cardsLeft, numCards)
%%%

% cardsLeft = 1:52;
% for card1 = cardsLeft
%   cardsLeft(cardsLeft == card1) = []; %Remove first card from cardDeck
%   for card2 = cardsLeft
%     cardsLeft(cardsLeft== card2) = []; %Remove second card from cardDeck
%     for card3 = cardsLeft
%       cardsLeft(cardsLeft == card3) = []; %Remove third card from cardDeck
%       for card4 = cardsLeft
%         handNumMatrix(handCounter, 1) = card1;
%         handNumMatrix(handCounter, 2) = card2;
%         handNumMatrix(handCounter, 3) = card3;
%         handNumMatrix(handCounter, 4) = card4;
%
%         handCounter = handCounter + 1;
%       end
%       cardsLeft = [cardsLeft card3]; %Put third card back again
%     end
%     cardsLeft = [cardsLeft card2]; %Put second card back again
%   end
%   cardsLeft = [cardsLeft card1]; %Put first card back again
% end

% assert(handCounter == (n+1))

handNumMatrix = unique(sort(handNumMatrix, 2), 'rows');
[numHands, ~] = size(handNumMatrix);

handMatrix = zeros(numHands, numCards, 2);
for hand = 1:numHands
  for card = 1:numCards
    handMatrix(hand, card, :) = cardDeck(handNumMatrix(hand, card), :);
  end
end

end
