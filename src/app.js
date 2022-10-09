const express = require('express');
const connection = require('./db/connection');

const app = express();

app.use(express.json());

app.get('/products', async (_req, res) => {
    const [result] = await connection.execute(
        'SELECT * FROM products',
    );

    if (result.length > 0) {
        return res.status(200).json(result);
    }

    res.status(400).json({ message: "Não foram localizados dados!" });

});

app.get('/products/:id', async (req, res) => {
    const id = parseInt(req.params.id);
    const [result] = await connection.execute(
        'SELECT * FROM products WHERE id = ?',
        [id],
    );

    if (result.length > 0) {
        return res.status(200).json(result);
    }

    res.status(400).json({ message: "Não foram localizados dados!" });

});

app.post('/products', async (req, res) => {
    const { name, price, in_stock } = req.body;

    const [{ insertId }] = await connection.execute(
        `INSERT INTO products (name, price, in_stock) VALUES (?, ?, ?)`,
        [
            name,
            price,
            in_stock,
        ],
    );

    if (insertId === 0) {
        return res.status(400).json({ message: "Erro ao realizar o cadastro" });
    }

    const newProduct = {
        id: insertId,
        name,
        price,
        in_stock
    }

    return res.status(201).json(newProduct);

});

app.put('/products/:id', async (req, res) => {
    const id = parseInt(req.params.id);
    const { name, price, in_stock } = req.body;

    const [{ affectedRows }] = await connection.execute(
        'UPDATE products SET name = ?, price = ?, in_stock = ? WHERE id = ?',
        [name, price, in_stock, id],
    );

    if (affectedRows === 0) {
        return res.status(400).json({ message: "Erro ao atualizar o cadastro" });
    }

    const updatedProduct = {
        id: id,
        name,
        price,
        in_stock
    }

    res.status(200).json(updatedProduct);
});

app.delete('/products/:id', async (req, res) => {
    const id = parseInt(req.params.id);
    const [{ affectedRows }] = await connection.execute(
        'DELETE FROM products WHERE id = ?',
        [id],
    );

    if (affectedRows === 0) {
        return res.status(400).json({ message: "Erro ao realizar a exclusão do cadastro" });
    }

    res.status(200).json({ message: "Registro removido com sucesso!" });
});

module.exports = app;