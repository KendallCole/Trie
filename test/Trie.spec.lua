local ServerScriptService = game:GetService("ServerScriptService")
return function()
    local Trie = require(ServerScriptService:WaitForChild("Trie"))

    describe("Trie", function()
        local trie = Trie.new()

        it("Should start empty", function()
            expect(trie:Size()).to.equal(0)
        end)


        it("Should not have the word 'foo'", function()
            expect(trie:HasWord("foo")).to.equal(false)
        end)

        it("Should have the word 'bar'", function()
            trie:Insert("bar")
            expect(trie:HasWord("bar")).to.equal(true)
        end)

        it("Should have the prefix 'ba'", function()
            expect(trie:HasPrefix("ba")).to.equal(true)
        end)

        it("Should not have the word 'ba'", function()
            expect(trie:HasWord("ba")).to.equal(false)
        end)


        it("Should have now have 2 words word", function()
            trie:Insert("baz")
            expect(trie:Size()).to.equal(2)
        end)

        it("Should have now be empty again", function()
            trie:Remove("bar")
            trie:Remove("baz")
            expect(trie:Size()).to.equal(0)
        end)

        local testWords = {"apple", "candy", "butter", "cow"}
        it("Should contain exactly the words: "..table.concat(testWords, ", "), function()
            for _, word in testWords do
                trie:Insert(word)
            end
            local containsAllWords = true

            for _, word in testWords do
                containsAllWords = (containsAllWords and trie:HasWord(word))
            end

            expect(containsAllWords and trie:Size() == #testWords).to.equal(true)           
        end)
    end)    
end