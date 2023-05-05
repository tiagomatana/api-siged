module.exports = class User {
    constructor(cpf, place, name, password, email, role, enable = true) {
        this.cpf = cpf;
        this.place = place;
        this.name = name;
        this.password = password;
        this.email = email;
        this.role = role;
        this.enable = enable;
    }

    getRole(){
        return this.role;
    }
}