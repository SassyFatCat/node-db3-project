const knex = require('knex');
const config = require('../knexfile.js');
const db = knex(config["development"]);

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update
};

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes')
        .where({ id })
}

function findSteps(id) {
    return db.select(['step_number', 'instructions', 'schemes.scheme_name']).from('steps')
        .join('schemes', 'scheme_id', 'schemes.id')
        .where({ scheme_id: id })
        .orderBy('step_number')
}

function add(scheme) {
    return db('schemes')
        .insert(scheme)
        .then(id => {
            return findById(id[0])
        })
}

function update(changes, id) {
    return db('schemes')
        .where({ id })
        .update(changes)
            .then(response => {
                return findById(id)
            })
}
