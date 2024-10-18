function verifyProof(proof, node, root, concat) {
    // Combine the node with the proof data to calculate the expected root
    let data = node;
    for (let i = 0; i < proof.length; i++) {
        const buffers = (proof[i].left) ? [proof[i].data, data] : [data, proof[i].data];
        data = concat(...buffers);
    }

    // Check if the calculated root matches the expected root
    return data === root;
}

module.exports = verifyProof;
