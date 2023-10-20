--!strict
local Trie = {}
Trie.__index = Trie

--[Node Class]--
type Node = {
    children: {string: Node},
    isWord: boolean,
}
local Node = {}
function Node.new(): Node
    return {
        children = {},
        isWord = false
    } :: Node -- No methods needed, returns a basic table
end

--[Trie Class]--
type Trie = typeof(setmetatable({}, {})) & {
    Root: Node,
    _Size: number,
}
function Trie.new()
    local self = {}   
    self.Root = Node.new()
    self._Size = 0
    return setmetatable(self :: Trie, Trie) 
end

function Trie:Insert(word: string)
    assert(type(word) == "string", "Trie entries must be a string!")
    local curNode: Node = self.Root
    for c: string in word:gmatch"." do
        if curNode.children[c] then
            curNode = curNode.children[c]
        else
            local nextNode = Node.new() 
            curNode.children[c] = nextNode
            curNode = nextNode
        end
    end
    if curNode.isWord == true then
        warn(`{word} is already in tree`)
    else
        curNode.isWord = true
        self._Size = (self._Size or 0) + 1 
    end
end

function Trie:Remove(word: string)
    assert(type(word) == "string", "must be a string!")
    local HasPre, Node = GetPrefix(self.Root, word)
    if (HasPre and Node.isWord==true) then
        local path = GetPathTo(word, self.Root)
        for i = #path, 2, -1 do -- Stop at index 2 so we never actually erase the root node
            local pathNode = path[i]
            if #pathNode.children == 0 then
                local parentNode = path[i-1]
                parentNode.children[pathNode] = nil
            end
        end
        self._Size = (self._Size or 0) - 1
        Node.isWord = false
    else
        warn(`{word} not in Trie`)
    end
end

function Trie:HasWord(query: string): boolean
   local HasPre, Node = GetPrefix(self.Root, query)
   return (HasPre and Node.isWord==true)
end

function Trie:HasPrefix(query: string): boolean
    assert(type(query) == "string", "query must be a string!")
    local HasPre = GetPrefix(self.Root, query)
    return HasPre
end

function Trie:GetWords(query: string?): {string}
    query = (query or "")
    assert(query)
    local exist, baseNode = GetPrefix(self.Root, query)
    if not exist then return {} end

    local words = {}
    GetWordsFromNode(query, baseNode, words) -- Mutates words array
    return words
end

function Trie:Size(): number
    return self._Size
end


--[Private helper functions]--


--Tracks node path so we can index it and crawl backwards removing any empty branches
function GetPathTo(word, fromNode: Node)
    local path = {}
    local curNode: Node = fromNode
    for c: string in word:gmatch"." do
        if curNode.children[c] then
            table.insert(path, curNode)
            curNode = curNode.children[c]
        else
            error(`Path in could not be found for word {word}`)
        end
    end
    return path
end


function GetPrefix(curNode, word: string): (boolean, Node)
    word = word or ""
    for c: string in word:gmatch"." do
        if curNode.children[c] then
            curNode = curNode.children[c]
            continue
        else
            return false, curNode
        end
    end 
    return true, curNode
end

--Recursivley passes a string to appened to and a table to add the word to for returning
function GetWordsFromNode(prefix: string, node: Node, wordArr): {string}
    if node == nil then return wordArr end
    wordArr = wordArr or {}
    for k, v in pairs(node.children) do
        if v.isWord == true then
            table.insert(wordArr, prefix..k)
        end
        GetWordsFromNode((prefix..k), v, wordArr)
    end
    return wordArr
end



return Trie


