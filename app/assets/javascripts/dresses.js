function Dress(dress) {
        this.id = dress.id;
        this.link = dress.link;
        this.material = dress.material;
        this.length = dress.length;
};

Dress.prototype.name = function() {
    return this.material + " " + this.length
};

function postDresses() {
    
};