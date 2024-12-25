<style scoped>
@media (min-width: 992px) {
    .image-height {
        max-height: 700px; /* ou la valeur que vous souhaitez */
        object-fit: contain;
    }
}
</style>

<template>
    <div v-if="!erreur" class="container my-5">
        <div class="row">
            <img :src="film.img" alt="" class="col-lg-6 col-md-6 col-12 img-fluid image-height">
            
            <div class="col-lg-6 col-md-6 col-12 mt-5">
                <h1 class="h1 display-3 text-center"><strong>{{ film.titre }}</strong></h1>
                <p class="my-5 h5 lead">{{ film.description }}</p>

                <ul>
                <li class="my-3">Année de sortie : {{ film.annee }}</li>
                <li class="my-3">realisateur : {{ film.realisateur }}</li>
                <li class="my-3">Catégorie : {{ film.categorie }}</li>
                </ul>

                <div class="d-flex justify-content-evenly mt-5">
                    
                        <button class="btn btn-warning" @click="suppression">Supprimer le film</button>

                    <RouterLink :to="'/films/modifier/'+id">
                        <button class="btn btn-secondary">Modifier le film</button>
                    </RouterLink>
                </div>
            </div>

        </div>

    </div>

    <!-- Affichage de l'erreur -->
    <div v-else class="container mt-4">
        <div class="alert alert-danger text-center" role="alert">
            <h4 class="alert-heading">Erreur !</h4>
            <p>{{ erreur }}</p>
            <hr>
            <button class="btn btn-primary" @click="router.back()">Retour</button>
        </div>
    </div>

</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'

const film = ref({})
const erreur = ref(null)
const router = useRouter()
const route = useRoute()
const id = route.params.id

// Fonction pour vérifier si l'ID est valide
const verifierID = (id) => {
    return !isNaN(id) && parseInt(id) > 0
}

// Fonction pour charger le film
const chargerFilm = async () => {
    try {
        // Vérification si l'ID est valide
        if (!verifierID(id)) {
            erreur.value = "L'identifiant du film est invalide"
            return
        }

        const requete = await fetch(`http://localhost:3000/films/${id}`)
        const data = await requete.json()

        // Vérifier si le film existe
        if (!data || data.erreur || !data.Titre) {
            erreur.value = "Le film demandé n'existe pas"
            return
        }

        film.value = {
            id: data.FilmId,
            titre: data.Titre,
            annee: data.Annee,
            realisateur: data.NomRealisateur,
            description: data.Description,
            img: data.ImageURL,
            categorie: data.NomCategorie
        }
    } catch (error) {
        console.error('Erreur:', error.message)
        erreur.value = "Erreur lors du chargement du film"
    }
}

const suppression = async () => {
    if (!confirm('Voulez-vous vraiment supprimer ce film ?')) {
        return
    }

    try {
        const response = await fetch(`http://localhost:3000/films/${id}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            }
        })

        const result = await response.json()
        if (result.success) {
            alert('Film supprimé avec succès !')
            router.push('/') 
        } else {
            alert('Erreur lors de la suppression du film: ' + result.error)
        }
    } catch (error) {
        console.error('Erreur:', error)
        alert('Erreur lors de la suppression du film')
    }
}

onMounted(() => {
    chargerFilm()
})
</script>