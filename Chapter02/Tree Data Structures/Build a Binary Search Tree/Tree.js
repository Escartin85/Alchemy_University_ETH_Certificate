class Tree {
    constructor() {
        this.root = null;
        this.parent = null;
    }

    addNode(node){
        const recursiveAdd = (current, newNode) => {
            if (newNode.data < current.data) {
                if (current.left === null) {
                    current.left = newNode;
                } else {
                    recursiveAdd(current.left, newNode);
                }
            } else {
                if (current.right === null) {
                    current.right = newNode;
                } else {
                    recursiveAdd(current.right, newNode);
                }
            }
        };

        if (this.root === null) {
            this.root = node;
        } else {
            recursiveAdd(this.root, node);
        }
        
        
    }
    
    insert(data) {
        let newNode = new Node(data);
        if (this.root === null) {
            this.root = newNode;
        } else {
            this.addNode(newNode);
        }
    }

    hasNode(number) {
        const recursiveSearch = (current) => {
            if (current === null) {
                return false;
            }
            if (current.data === number) {
                return true;
            } else if (number < current.data) {
                return recursiveSearch(current.left);
            } else {
                return recursiveSearch(current.right);
            }
        };

        return recursiveSearch(this.root);
    }
}

module.exports = Tree;