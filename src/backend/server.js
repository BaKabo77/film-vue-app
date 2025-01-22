import express from 'express'
import { fileURLToPath } from 'url'
import { dirname, join } from 'path'
// import fs from 'fs/promises'
import { films, film, getCategories, addFilm, updateFilm, deleteFilm } from './database.js'
import cors from 'cors'

const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)

const app = express();
const port = 3000;

// Middleware pour parser le JSON
app.use(express.json());
app.use(cors())

// Route simple GET à la racine
app.get('/', (req, res) => {
  res.send(' Bonjour, monde!');
});

app.get('/films', async (req, res) => {

  const index = req.query.index

  try{
    const data = await films(index)
    res.json(data)
  }catch(err){
    console.error('Erreur:', err)
    res.status(500).json({ error: "Erreur lors de l'acces a la base" })
    
  }
  
})

app.get('/films/:id', async (req, res) => {

  const id = parseInt(req.params.id)
  try {
    const filmx = await film(id+1)
    res.json(filmx[0])
  } catch (error) {
    console.error('Erreur:', error)
    res.status(500).json({ error: 'Erreur lors de la lecture du fichier' })
  }
})

app.get('/categories',async (req, res) => {
    try{
      const data = await getCategories()
      console.log('hey')
      res.json(data)
    }catch(err){
      console.error('Erreur:', err)
      res.status(500).json({ error: "Erreur lors de l'acces a la base" }) 
    }
})

app.post('/films/ajout', async(req, res) => {
  try {
    const filmData = req.body;
    console.log(filmData)
    // Vérification des données requises
    if (!filmData.titre || !filmData.annee || !filmData.realisateur || !filmData.description || !filmData.categorie) {
      return res.status(400).json({ 
        success: false, 
        error: "Tous les champs sont obligatoires" 
      });
    }

    const resultat = await addFilm(filmData);
    if (resultat.success) {
      res.json({ 
        success: true, 
        message: "Film ajouté avec succès",
        id: resultat.id 
      });
    } else {
      res.status(500).json({ 
        success: false, 
        error: resultat.erreur 
      });
    }

  } catch(err) {
    console.error('Erreur:', err);
    res.status(500).json({ 
      success: false, 
      error: "Erreur lors de l'ajout du film" 
    });
  }
});

// Route PUT pour modifier un film
app.put('/films/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id);
    const filmData = req.body;

    // Vérification des données requises
    if (!filmData.titre || !filmData.annee || !filmData.realisateur || !filmData.description || !filmData.categorie) {
      return res.status(400).json({ 
        success: false, 
        error: "Tous les champs sont obligatoires" 
      });
    }

    const resultat = await updateFilm(id, filmData);
    if (resultat.success) {
      res.json({ 
        success: true, 
        message: "Film modifié avec succès"
      });
    } else {
      res.status(500).json({ 
        success: false, 
        error: resultat.erreur 
      });
    }

  } catch(err) {
    console.error('Erreur:', err);
    res.status(500).json({ 
      success: false, 
      error: "Erreur lors de la modification du film" 
    });
  }
});

// Route DELETE pour supprimer un film
app.delete('/films/:id', async (req, res) => {
  try {
    const id = parseInt(req.params.id);
    const resultat = await deleteFilm(id);
    
    if (resultat.success) {
      res.json({ 
        success: true, 
        message: "Film supprimé avec succès"
      });
    } else {
      res.status(500).json({ 
        success: false, 
        error: resultat.erreur 
      });
    }

  } catch(err) {
    console.error('Erreur:', err);
    res.status(500).json({ 
      success: false, 
      error: "Erreur lors de la suppression du film" 
    });
  }
});

// Route POST pour recevoir des données
/*app.post('/api/data', (req, res) => {
  const data = req.body;
  res.json({
    message: 'Données reçues avec succès',
    data: data
  });
});
*/

// Démarrage du serveur et écoute sur le port spécifié
app.listen(port, () => {
  console.log(`Le serveur est en cours d'exécution sur http://localhost:${port}`);
});