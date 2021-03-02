function caesar(word, shift) {
    if (shift == 0) {
       return word;
     }
    const wordTest = word.split('');
       console.log(wordTest);
     const re = /\w/;
    for(let i =0; i < wordTest.length; i++) {
        if(re.test(wordTest[i])){
            let charNum = wordTest[i].charCodeAt()

            let convertBack = String.fromCharCode(charNum + shift)
            wordTest[i] = convertBack;
            
        }
    }

    return wordTest.join('')

        
}
console.log(caesar("What a string!", 5));