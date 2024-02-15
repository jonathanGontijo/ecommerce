const jwt = require('jsonwebtoken');
const User = require('../models/user');

const admin = async (req, res, next ) => {
    try{
        const token = req.header('x-auth-token');
        if(!token)
            return res.status(401).json({msg: "Token não autorizado, acesso negado!"});

        const verified = jwt.verify(token, "passwordKey");
        if (!verified) 
            return res
        .status(401)
        .json({msg: 'Falha na verificação do token, autorização negada!'});

        const user = await User.finById(verified.id);

        if(user.type == 'user' || user.type == 'seller'){
            return res.status(401).json({msg: "Você não é admin!"});
        }
        req.user = verified.id;
        req.token = token;
        next();
    }catch(err){
        res.status(500).json({error: err.message});
    }
}
