// there are 5 participants, and a drawing of 5 different cards with 
//    each others name on them
// each player picks a card, in order A B C D E, and re-draws if they pick themselves
// the next player then has 1 less option to choose from until all have been chosen

// what are the odds that there is a player that has someone that also has them?

// two classes, player and card

// first, make all the players and cards
ArrayList<Player> players = new ArrayList<Player>();
ArrayList<String> cards = new ArrayList<String>();

players.add(new Player("Anna"));
players.add(new Player("Marley"));
players.add(new Player("Tessa"));
players.add(new Player("Hayley"));
players.add(new Player("Alayna"));

cards.add("Anna");
cards.add("Marley");
cards.add("Tessa");
cards.add("Hayley");
cards.add("Alayna");

// player 1 picks a card, and its taken away. 