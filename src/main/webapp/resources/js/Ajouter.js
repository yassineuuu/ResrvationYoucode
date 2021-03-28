var role = document.getElementById('role-select');
var classe = document.getElementById('classe');
var promo = document.getElementById('promo');
var club = document.getElementById('club');

role.addEventListener("change", ev => {
    if (role.value === "Formateur"){
        promo.removeChild(promo.childNodes[0]);
        club.removeChild(club.childNodes[0]);
        classe.innerHTML = "<select class='custom-select' id='role-select' name='spec'  value='${utilisateurs.role}>'" +
            "<option value=''>--Choix du Spécialité--</option>\n" +
            "                <option value='JEE'>JEE</option>\n" +
            "                <option value='C#'>C#</option>\n" +
            "                <option value='FEBE'>FEBE</option>\n" +
            "            </select>";

    }else if (role.value === "Apprenant"){
        classe.innerHTML = "<input type='text' className='form-control' name='spec' placeholder='Spécialité' required='required' value='${apprenant.classe}>'>";
        promo.innerHTML = "<input type='text' className='form-control' name='promotion' placeholder='Promotion' required='required' value='${apprenant.promo}>'>";
        club.innerHTML = "<input type='text' className='form-control' name='club' placeholder='Club' required='required' value='${apprenant.club}>'>";
    }else {
        classe.removeChild(classe.childNodes[0]);
        promo.removeChild(promo.childNodes[0]);
        club.removeChild(club.childNodes[0]);
    }
})