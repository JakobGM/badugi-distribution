function [cardsLeft handCounter] = numToHandMatrix(cardsLeft, handCounter, cardCounter, numCards)

global handNumMatrix
global cardVector

for card = cardsLeft
  cardVector = [cardVector card];
  cardsLeft(cardsLeft == card) = [];

  if length(cardVector) < numCards
    [cardsLeft handCounter] = numToHandMatrix(cardsLeft, handCounter, cardCounter+1, numCards);

  elseif length(cardVector) == numCards
    handCounter = handCounter + 1;
    handNumMatrix(handCounter, 1:numCards) = cardVector;
    cardVector = [];

    if mod(handCounter, 100000) == 0
      fprintf('%i hand permutations generated\n', handCounter)
    end

  else
    fprintf('length of assembled card vector = %i\n', length(cardVector))
    error('length of card vector out of bounds: max value is ‰i', numCards)
  end

  cardsLeft = [cardsLeft card];

end

end
