<template>

<div class="container">

    <h1 class="text-center">Ajout de film</h1>

    <form id="FormAjout" @submit.prevent="recuperation">
        <div class="form-group mb-2">
            <label for="" class="form-label">Titre du film </label>
            <input type="text" class="form-control" name="titre">
        </div>
        
        <div class="form-group mb-2">
            <label for="" class="form-label">Nom du Réalisateur</label>
            <input type="text" class="form-control" name="realisateur">
        </div>

        <div class="form-group mb-2">
            <label for="" class="form-label">Année du film</label>
            <input type="text" class="form-control" name="annee" maxlength="4" >
        </div>
        
        <div class="form-group mb-2">
            <label for="" class="form-label">Description du film</label>
            <textarea name="description" class="form-control"></textarea>
        </div>

        <div class="form-group mb-2">
            <label for="categorie" class="form-label">Catégorie du film</label>
            <select name="categorie" class="form-control" v-model="categorieSelectionnee">
                <option value="">Sélectionnez une catégorie</option>
                <option v-for="categorie in listeCat" 
                        :key="categorie.NomCategorie" 
                        :value="categorie.NomCategorie">
                    {{ categorie.NomCategorie }}
                </option>
            </select>
        </div>

        <div class="form-group mb-2">
            <label for="form-label">Inserer le lien de l'image</label>
            <input v-model="imgUrl" type="text" class="form-control">
        </div>


        <button class="btn-dark btn my-3">Ajouter le film</button>

        <div class="border p-2 shadow mb-5 justify-content-center d-flex"><img src="" alt="" id="image" class="img-fluid"></div>


    </form>

</div>

</template>

<script setup>
import { onMounted, ref, watch } from 'vue';
import Categorie from './categorie.vue';


const imgUrl = ref('')

const listeCat = ref(null)
const categorieSelectionnee = ref('')

watch(imgUrl,(newValue)=>{
    const divImg = document.getElementById('image')
    divImg.src = newValue
    divImg.onerror = ()=>{
        divImg.src = 'https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg'
    }
})


const recuperation = async()=>{
    const donnees = transfert();
    if (!donnees) return;
    
    try {
        const reponse = await fetch(`${import.meta.env.VITE_API_URL}/films/ajout`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(donnees)
        });
        
        const resultat = await reponse.json();
        
        if (resultat.success) {
            alert('Film ajouté avec succès !');
            document.getElementById('FormAjout').reset();
            imgUrl.value = '';
        } else {
            alert('Erreur lors de l\'ajout du film : ' + resultat.error);
        }
    } catch(error) {
        alert('Erreur lors de la communication avec le serveur');
    }
}

const transfert = ()=>{

    let form = document.getElementById('FormAjout')

    const formData = new FormData(form)
    const data = {}

    for (const [key, value] of formData.entries()) {

        if(value === ''){

            alert(`le champ ${key} est vide`)
            return
             
        }
            data[key] = value
        }
    
    data['img'] = document.getElementById('image').src

    return data
}

onMounted(async()=>{
    try {
        const getCategories = await fetch(`${import.meta.env.VITE_API_URL}/categories`)
        const categories = await getCategories.json()
        listeCat.value = categories
    } catch(error) {
        console.error("Erreur lors du chargement des catégories:", error)
    }
})

</script>