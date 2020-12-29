package BeanPackage;

public class Utilisateur {
    private String email;
    private String motDePasse;
    private String nom;
    private String prenom;
    private String pseudo;
    private String dateDeNaissance;
    private String profilPicture;
    private String id;
    private Boolean isPositif;
    private Boolean isAdmin;

    public Utilisateur(){
        email = null;
        motDePasse = null;
        nom = null;
        prenom = null;
        pseudo = null;
        dateDeNaissance = null;
        profilPicture = null;
        id = null;
        isPositif = null;
        isAdmin = null;
    }

    public String getProfilPicture() {
        return profilPicture;
    }

    public void setProfilPicture(String profilPicture) {
        this.profilPicture = profilPicture;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getEmail() {
        return email;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }
    public String getMotDePasse() {
        return motDePasse;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNom() {
        return nom;
    }

    public void setDateDeNaissance(String dateDeNaissance) {
        this.dateDeNaissance = dateDeNaissance;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getPseudo() {
        return pseudo;
    }


    public String getDateDeNaissance() {
        return dateDeNaissance;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Boolean getPositif() {
        return isPositif;
    }

    public void setPositif(Boolean postif) {
        isPositif = postif;
    }

    public Boolean getAdmin() {
        return isAdmin;
    }

    public void setAdmin(Boolean admin) {
        isAdmin = admin;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Utilisateur)) return false;
        Utilisateur that = (Utilisateur) o;
        return getId().equals(that.getId());
    }
}