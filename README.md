[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# UNO!
## Weenie Hut Jr. 
by Daniel Teboul and Tahmim Hassan
## Overview
Our project is a replica of the popular card game, UNO, in Processing. There are 108 cards in the deck.
The game starts with 4 Player objects, each with their own hands containing 7 Card objects, taken from the Card pool in the Deck object.

Each avatar is displayed next to their hand.
Cards are shown to be playable by being above the rest of the hand.
Pile is in the center showing the most recently played card.
Around the Pile are arrows indicating the direction of the game.
Deck is in the bottom right of the screen.
Our model follows house rules.

## Instructions
Our project has a lot of images, but they're all in their own folder in the UNO directory. Our screen size is 1600 * 1000.

To play a card, click on it when the star is near you and it is shown to be playable. The star indicates which players turn it is.
To draw a card, click on the deck in the bottom right. When no cards are able to be played, 2 Arrows indicate the deck. Our model only has a player draw once, and then their turn is over.

When playing a 0, all players swap cards with the player on their left or right based on the direction of the game, indicated by the arrows.
When playing a 7, the player will swap hands with whoever has the smallest hand. 
Wildcards and Draw-4's allow any color card to be played after it. 

### Shortcuts
To end the game instantly, press K. Press K again when prompted to restart the game. 

### Bugs
So far, the only bug we've found is that when using K to end an already restarted game, it crashes. 

