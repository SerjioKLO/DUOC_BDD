use('tinder');

db.explorar.insertOne(
    {
        "username" : "Luchito",
        "age" : 20,
        "description" : "Nerd d close",
        "hobbies" : [
            "programar",
            "pokemon tcg"
        ],
        "images" : [
            "https://www.cooperativa.cl/noticias/site/artic/20171012/imag/foto_0000002020171012083354.jpg"
        ]
    }
);

use('tinder')

db.explorar.findOne(
    {
        "username" : "Pepita"
    }
);