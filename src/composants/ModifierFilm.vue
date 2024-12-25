<template>
  <div class="container mt-4" v-if="!erreur">
    <h2>Modifier le film</h2>
    <form @submit.prevent="modifierFilm" class="mt-4">
      <div class="mb-3">
        <label for="titre" class="form-label">Titre</label>
        <input 
          type="text" 
          class="form-control" 
          id="titre" 
          v-model="film.titre" 
          required
        >
      </div>

      <div class="mb-3">
        <label for="annee" class="form-label">Année</label>
        <input 
          type="number" 
          class="form-control" 
          id="annee" 
          v-model="film.annee" 
          required
        >
      </div>

      <div class="mb-3">
        <label for="realisateur" class="form-label">Réalisateur</label>
        <input 
          type="text" 
          class="form-control" 
          id="realisateur" 
          v-model="film.realisateur" 
          required
        >
      </div>

      <div class="mb-3">
        <label for="description" class="form-label">Description</label>
        <textarea 
          class="form-control" 
          id="description" 
          v-model="film.description" 
          rows="3" 
          required
        ></textarea>
      </div>

      <div class="mb-3">
        <label for="categorie" class="form-label">Catégorie</label>
        <select 
          class="form-select" 
          id="categorie" 
          v-model="film.categorie" 
          required
        >
          <option v-for="categorie in categories" 
                  :key="categorie.CategorieID" 
                  :value="categorie.NomCategorie">
            {{ categorie.NomCategorie }}
          </option>
        </select>
      </div>

      <div class="mb-3">
        <label for="imageUrl" class="form-label">URL de l'image</label>
        <input 
          type="text" 
          class="form-control" 
          id="imageUrl" 
          v-model="film.ImageURL"
        >
      </div>

      <div class="d-flex gap-2">
        <button type="submit" class="btn btn-primary">Modifier</button>
        <button type="button" class="btn btn-secondary" @click="router.back()">Annuler</button>
      </div>
    </form>
  </div>

  <!-- Affichage de l'erreur -->
  <div v-else class="container mt-4">
    <div class="text-center alert-danger">
      <h4 class="alert-heading">Erreur !</h4>
      <p>{{ erreur }}</p>
      <hr>
      <button class="btn btn-primary" @click="router.back()">Retour</button>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'

const route = useRoute()
const router = useRouter()
const erreur = ref(null)

const film = ref({
  titre: '',
  annee: '',
  realisateur: '',
  description: '',
  categorie: '',
  ImageURL: ''
})

const categories = ref([])

// Fonction pour charger les catégories
const chargerCategories = async () => {
  try {
    const response = await fetch('http://localhost:3000/categories')
    categories.value = await response.json()
  } catch (error) {
    console.error('Erreur lors de la récupération des catégories:', error)
    erreur.value = "Erreur lors du chargement des catégories"
  }
}

// Fonction pour vérifier si l'ID est valide
const verifierID = (id) => {
  return !isNaN(id) && parseInt(id) > 0
}

// Fonction pour charger les données du film
const chargerFilm = async () => {
  try {
    // Vérification si l'ID est valide
    if (!verifierID(route.params.id)) {
      erreur.value = "L'identifiant du film est invalide"
      return
    }

    const response = await fetch(`http://localhost:3000/films/${route.params.id}`)
    const filmData = await response.json()

    // Vérifier si le film existe
    if (!filmData || filmData.erreur || !filmData.Titre) {
      erreur.value = "Le film demandé n'existe pas"
      return
    }

    film.value = {
      titre: filmData.Titre,
      annee: filmData.Annee,
      realisateur: filmData.NomRealisateur,
      description: filmData.Description,
      categorie: filmData.NomCategorie,
      ImageURL: filmData.ImageURL
    }
  } catch (error) {
    console.error('Erreur lors de la récupération du film:', error)
    erreur.value = "Erreur lors du chargement du film"
  }
}

// Fonction pour modifier le film
const modifierFilm = async () => {
  try {
    const response = await fetch(`http://localhost:3000/films/${route.params.id}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(film.value)
    })

    const result = await response.json()
    if (result.success) {
      alert('Modification faite !!!')
      router.back()
    } else {
      alert('Erreur lors de la modification du film: ' + result.error)
    }
  } catch (error) {
    console.error('Erreur:', error)
    alert('Erreur lors de la modification du film')
  }
}

// Charger les données au montage du composant
onMounted(async () => {
  await Promise.all([chargerCategories(), chargerFilm()])
})
</script>

<style scoped>
.container {
  max-width: 800px;
}
</style> 