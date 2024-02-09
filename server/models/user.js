const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    email: {
        required: true,
        type: String,
        trim: true,
        alidator: (value) => {
            const re =
              /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            return value.match(re);
          },
          message: "Por favor entre com um email valido" 
    },
    password: {
        required: true,
        type: String,
        // validator: (value)=> {
        //     return value.length > 6
        // },
        // message : 'Email muito curto',

    },
    adress: {
        type: String,
        default: '',
    },
    type: {
        type: String,
        default: 'user',
    }
   //cart 
});

const User = mongoose.model('User', userSchema);
module.exports = User;