const TrieNode = require('./TrieNode');

class Trie {
    constructor() {
        this.root = new TrieNode(null);
    }

    insert(word) {
        
        //
        let currentNode = this.root;
        for (const char of word) {
            if (!currentNode.children[char]) {
                currentNode.children[char] = new TrieNode(char);
            }
            currentNode = currentNode.children[char];
        }
        currentNode.isWord = true;
    }

    contains(word) {
        let currentNode = this.root;
        for (const char of word) {
            if (!currentNode.children[char]) {
                return false; // If a character is not found, the word is not present
            }
            currentNode = currentNode.children[char];
        }
        return currentNode.isWord; // Check if the last node is marked as a word
    }
}

module.exports = Trie;