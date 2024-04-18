-- local Trie = require(script.Parent:WaitForChild("Trie")) :: any
-- local TestTrie = Trie.new()
-- local function printbr() print("============================\n\n") end

-- print(`Hello, my TestTrie should be empty. Lets see:`)
-- print(TestTrie:GetWords())
-- print(`Lets add some words and check again!`)
-- TestTrie:Insert("dog")
-- TestTrie:Insert("cat")
-- TestTrie:Insert("cow")
-- TestTrie:Insert("foo")
-- TestTrie:Insert("bar")
-- TestTrie:Insert("baz")
-- TestTrie:Insert("food")
-- print(TestTrie:GetWords())
-- printbr()

-- print(`Lets only get the words that begin with 'c'`)
-- print(TestTrie:GetWords("c"))
-- printbr()

-- print(`Lets see if we can find the WORD 'fo' in our tree:`)
-- print(`Tree contains WORD 'fo': {TestTrie:HasWord("fo")}`)
-- printbr()

-- print(`Lets see if we can find the PREFIX 'fo' in our tree:`)
-- print(`Tree contains PREFIX 'fo': {TestTrie:HasPrefix("fo")}`)
-- printbr()

-- print(`Lets see if we can find food in our tree:`)
-- print(`Tree contains 'food': {TestTrie:HasWord("food")}`)
-- printbr()

-- print(`Lets remove it and check again`)
-- TestTrie:Remove("food")
-- print(`Tree contains 'food': {TestTrie:HasWord("food")}`)
-- printbr()



-- local NUMBER_OF_SEARCHES = 750000 
-- local largeTrie = Trie.new()
-- local BigWordList = require(script:WaitForChild("csvWords"))
-- for _, word in BigWordList do
--     largeTrie:Insert(word)
-- end
-- print(`I just made a new tree with lots of words, lets see how many words are in it: largeTrie:Size0() = {largeTrie:Size()}`)

-- printbr()
-- print(`As a speed test, lets query our big list of words searching it using .find and searching it with our Trie :HasWord to see which is faster`)
-- local findStartTime = tick()
-- local findFound = 0
-- for i = 1,NUMBER_OF_SEARCHES do
--     local query = BigWordList[math.random(1, #BigWordList)] 
--     if table.find(BigWordList, query) then
--         findFound += 1
--     end
-- end
-- local findSpeed = tick()-findStartTime
-- warn(`[{findFound}/{NUMBER_OF_SEARCHES} found] using table.find took {findSpeed} to query {NUMBER_OF_SEARCHES} words`)

-- local trieStartTime = tick()
-- local trieFound = 0
-- for i = 1,NUMBER_OF_SEARCHES do
--     local query = BigWordList[math.random(1, #BigWordList)] 
--     if largeTrie:HasWord(query) then
--         trieFound += 1
--     end
-- end
-- local trieSpeed = tick()-trieStartTime -- If we where searching for words not in the list this would be much faster 
-- warn(`[{trieFound}/{NUMBER_OF_SEARCHES} found] using Trie:HasWord() took {trieSpeed} to query {NUMBER_OF_SEARCHES} words`)
