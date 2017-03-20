const fs = require('fs')
const path = require('path')

function resolve(name) {
    return path.resolve(__dirname, `./zh_CN/${name}`)
}

let files = fs.readdirSync(resolve(''));

files.forEach(filename => {
    const match = /q(\d+)/.exec(filename)
    if (match) {
        const num = parseInt(match[1])
        if (num > 33) {
            const targetName = filename.replace(/q\d+/, `q${num - 1}`)
            fs.rename(resolve(filename), resolve(targetName), err => {
                if (!err) {
                    console.log(filename + ' => ' + targetName)
                }
            })
        }
    }
})

