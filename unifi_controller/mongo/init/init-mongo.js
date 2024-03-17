db.getSiblingDB("unifidb").createUser({user: "unifi", pwd: "uN!fiD82O24", roles: [{role: "readWrite", db: "unifidb"}]});
db.getSiblingDB("unifidb_stat").createUser({user: "unifi", pwd: "uN!fiD82O24", roles: [{role: "readWrite", db: "unifidb_stat"}]});
