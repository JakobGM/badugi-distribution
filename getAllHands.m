function handMatrix = getAllHands(numCards)
% Takes in number of cards in one hand and returns all permutations of hands

% Combinatoric parameters
n = factorial(52) / factorial(52 - numCards); % Amount of hands
cardsInDeck = 52;

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
handMatrix = zeros(n, numCards, 2);
handCounter = 1;

cardsLeft = 1:52;
for card1 = cardsLeft
  cardsLeft(cardsLeft == card1) = []; %Remove first card from cardDeck
  for card2 = cardsLeft
    cardsLeft(cardsLeft== card2) = []; %Remove second card from cardDeck
    for card3 = cardsLeft
      cardsLeft(cardsLeft == card3) = []; %Remove third card from cardDeck
      for card4 = cardsLeft

        handMatrix(handCounter, 1, :) = cardDeck(card1, :);
        handMatrix(handCounter, 2, :) = cardDeck(card2, :);
        handMatrix(handCounter, 3, :) = cardDeck(card3, :);
        handMatrix(handCounter, 4, :) = cardDeck(card4, :);

        handCounter = handCounter + 1;

      end
      cardsLeft = [cardsLeft card3]; %Put third card back again
    end
    cardsLeft = [cardsLeft card2]; %Put second card back again
  end
  cardsLeft = [cardsLeft card1]; %Put first card back again
end

assert(handCounter == (n+1))

end
