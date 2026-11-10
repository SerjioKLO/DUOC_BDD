use('directorio_talento');

db.perfiles.find();

db.empresas.find(
    {
        creado_por: 'Serjio'
    }
); 


db.empresas.insertMany(
    [
        {
            nombre: 'Statikk.gg',
            rubro: 'Proceso de estadisticas de videojuegos',
            empleados: 67,
            ciudad: 'Puerto Montt',
            creado_por: 'Serjio'
        },
        {
            nombre: 'Riot Games',
            rubro: 'Empresa de videojuegos',
            empleados: 420,
            ciudad: 'SANTIAGO',
            creado_por: 'Serjio'
        }
    ]
);

db.ofertas.insertMany(
    [
        {
            cargo: 'Calentador de asiento',
            empresa: 'Su domicilio',
            modalidad: 'Presencial',
            sueldo: -20000,
            vacantes: 0,
            requisitos: [
                'Asiento',
                'Flojera',
                'Steam'
            ],
            activa:true,
            creado_por: 'Serjio'
        },
        {
            cargo: 'Desarrollador Software',
            empresa: 'Tesla',
            modalidad: 'Remoto',
            sueldo: 7000000,
            vacantes: 9,
            requisitos: [
                {
                    nombre: 'C++',
                    seniority: 'Senior'
                },
                {
                    nombre: 'Python',
                    seniority: 'Semi-senior'
                },
                {
                    nombre: 'Java',
                    seniority: 'Senior'
                }
            ],
            activa:true,
            creado_por: 'Serjio'
        }
    ]
);

use('directorio_talento');
db.ofertas.find(
    {
        sueldo: {$gt : 10000000}
    }
);

/* 
gt: Greater than >

gte: greater than equals >=

lt: Lower that <

lte: Lower than equals <=

ne: Not equals !=

eq: Equals =

nin: Not in
*/

use('directorio_talento');
db.ofertas.find(
    {
        modalidad: {$nin : ['Presencial', 'Precencial']}
    }
);