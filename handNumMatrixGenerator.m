function handNumMatrixGenerator(cardsLeft, numCards)

global handNumMatrix
global cardVector
global handCounter
global cardCounter

for card = cardsLeft
  cardCounter = cardCounter + 1;
  cardVector(cardCounter) = card;
  cardsLeft(cardsLeft == card) = [];

  if cardCounter < numCards
    handNumMatrixGenerator(cardsLeft, numCards);
  elseif cardCounter == numCards
    handCounter = handCounter + 1;
    handNumMatrix(handCounter, 1:numCards) = cardVector;
    cardVector = zeros(1,numCards);
    cardCounter = 0;

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
