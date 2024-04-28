## Boogle - Elixir

This is the word game Boogle where in a given case of letters you will have to find legal words.<br/>
This program will find the words for you, in given a board of letters, and return the indices of each letter of that word.<br/>
For example if the word given is rain the user will be given a map of the indexes on the board<br/>

&emsp;&emsp;&emsp;&emsp;    a &emsp; e &emsp; r &emsp; b<br/>

&emsp;&emsp;&emsp;&emsp;    d &emsp; t &emsp; a &emsp; h<br/>

&emsp;&emsp;&emsp;&emsp;    n &emsp; i &emsp; c &emsp; n<br/>

&emsp;&emsp;&emsp;&emsp;    p &emsp; e &emsp; r &emsp; s<br/>

The given **output** would be: <b/>%{"rain: =>[{0,2}, {1,2}, {2,1}, {2,0}]}</b>
