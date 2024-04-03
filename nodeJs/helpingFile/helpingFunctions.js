const fs = require('fs');
const path = require('path');

let pathToImage = (pathToImg) => {
    return fs.readFileSync(path.join(__dirname, pathToImg), 'base64');
};

module.exports = {
    pathToImage
};
