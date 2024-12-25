import sql from 'mysql2/promise'


const database = await sql.createConnection({
    host:'localhost',
    user:'root',
    password:'root',
    database:'filmsdb'
})


export const films = async()=>{
    try{

        const films = await database.execute('SELECT f.FilmID,f.Titre,f.Annee,r.NomRealisateur,f.Description,f.ImageURL,c.NomCategorie FROM Films f JOIN Realisateurs r ON f.RealisateurID = r.RealisateurID JOIN Categories c ON f.CategorieID = c.CategorieID order by f.FilmID')
        return films[0]  

    }catch(err){

        return {
            erreur:err.message
        }
    }
}

export const film = async(id)=>{

    try{

        const film = await database.execute(
            "SELECT f.FilmID,f.Titre,f.Annee,r.NomRealisateur,f.Description,f.ImageURL,c.NomCategorie FROM Films f JOIN Realisateurs r ON f.RealisateurID = r.RealisateurID JOIN Categories c ON f.CategorieID = c.CategorieID where f.FilmID = ?",[id-1]
        )
        return film[0]
        
    }catch(err){

        return {
            erreur:err.message
        }
    }


}

export const getCategories = async()=>{

    try{

        const Categories = await database.execute("SELECT * from categories order by CategorieID")
        return Categories[0]

    }catch(err){

        return {
            erreur:err.message
        }

    }
}

export const addFilm = async(f)=>{
    try {

        await database.execute("insert into realisateurs (NomRealisateur) values (?)",[f.realisateur])


        const ajout = await database.execute(
            "INSERT INTO films (Titre, Annee, RealisateurID, Description, ImageURL, CategorieID) VALUES (?, ?, (SELECT RealisateurID FROM realisateurs WHERE NomRealisateur = ?), ?, ?, (SELECT CategorieID FROM categories WHERE NomCategorie = ?))",
            [f.titre, f.annee, f.realisateur, f.description, f.img, f.categorie]
        );


        return { success: true, id: ajout[0].insertId };
    } catch(err) {
        return {
            erreur: err.message,
            success: false
        };
    }
}

export async function updateFilm(id, filmData) {
  try {

    console.log(filmData.realisateur + "  " + filmData.categorie)
    
    const [result] = await database.execute(`
      UPDATE films 
      SET Titre = ?, Annee = ?, RealisateurID = (SELECT RealisateurID FROM realisateurs WHERE NomRealisateur = ?), Description = ?, CategorieID = (SELECT CategorieID FROM categories WHERE NomCategorie = ?)
      WHERE FilmID = ?
    `, [
      filmData.titre,
      filmData.annee,
      filmData.realisateur,
      filmData.description,
      filmData.categorie,
      id
    ]);

    if (result.affectedRows === 0) {
      return { success: false, erreur: "Film non trouvé" };
    }

    return { success: true };
  } catch (error) {
    console.error('Erreur lors de la modification:', error);
    return { success: false, erreur: error.message };
  }
}

export async function deleteFilm(id) {
  try {

    const [result] = await database.execute('DELETE FROM films WHERE FilmID = ?', [id]);


    if (result.affectedRows === 0) {
      return { success: false, erreur: "Film non trouvé" };
    }

    return { success: true };
  } catch (error) {
    console.error('Erreur lors de la suppression:', error);
    return { success: false, erreur: error.message };
  }
}