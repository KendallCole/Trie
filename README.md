# Trie / Prefix Tree
Trie / prefix tree implementation intended for ROBLOX development. Examples of use could be increasing 

## Constructor
```lua
Trie.new()
```
Returns an empty Trie.
## Methods 
```lua
Trie:Insert(word: string)
```
Iterates through the provided string front to back, creating Nodes in the Trie where necessary. The last node of the word is marked with the ```Node.isWord=true``` flag.

```lua
Trie:Remove(word: string)
```
Sets the last word Node in the Trie as ```Node.isWord=false```, and then deletes any visited nodes that have no children from bottom to top.

```lua
Trie:HasWord(query: string): boolean
```
Searches the Trie for nodes that are ordered the same way as query starting from Root. Only returns true if ```Node.isWord=true``` for the last visited node.

```lua
Trie:HasPrefix(query: string): boolean
```
Searches the Trie for nodes that are ordered the same way as query starting from Root. Returns true regardless of ```Node.isWord```.

```lua
Trie:GetWords(): {string}
```
Returns an array of every word in the Trie.

```lua
Trie:GetWords(query: string): {string}
```

Returns an array of strings containing any string beginning with ```query```.

```
Trie:Size(): number
```
Returns the number of words that the tree contains.
