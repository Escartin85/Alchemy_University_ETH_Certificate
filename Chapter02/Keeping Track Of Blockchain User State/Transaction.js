class Transaction {
    constructor(inputUTXOs, outputUTXOs) {
        this.inputUTXOs = inputUTXOs;
        this.outputUTXOs = outputUTXOs;
        this.fee = 0;
    }
    execute() {
        let totalINPUTS = 0;
        let totalOUTPUTS = 0;
        for (let i = 0; i < this.inputUTXOs.length; i++) {
            //console.log(this.inputUTXOs[i]);
            try {
                if (this.inputUTXOs[i].spent === true) {
                    throw "Error";
                }else{
                    //console.log("E");
                    for (let i = 0; i < this.inputUTXOs.length; i++) {
                        totalINPUTS = totalINPUTS + this.inputUTXOs[i].amount;
                    }
                    //console.log(totalINPUTS);
                    for (let i = 0; i < this.outputUTXOs.length; i++) {
                        totalOUTPUTS = totalOUTPUTS + this.outputUTXOs[i].amount;
                    }
                    //console.log(totalOUTPUTS);
                    if(totalINPUTS < totalOUTPUTS) {
                        throw "Error!: Inputs IS LESS THAN Outputs";
                    }else{
                        console.log("Successful");
                        this.inputUTXOs[i].spend();
                    }
                }

            }
            catch (err) {
                //console.log(err);
                throw err;
            }
            
        }
        
        this.fee = totalINPUTS - totalOUTPUTS;
        
    }
}

module.exports = Transaction;