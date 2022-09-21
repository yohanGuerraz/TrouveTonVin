from multiprocessing import reduction
import os
from flask import Flask, request
from flask_restful import  Api, Resource
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.sql import text
import globalVar
import json
import mysql.connector
from mysql.connector import Error
# INIT constante global (stocke toute les constantes)
globalVar.initialize()

# SETUP systeme application (adresse IP, port system, debug, URL DB)
app = Flask(__name__)
#INIT une instance d'API
api = Api(app)
#INIT instance de connexion DB
db = mysql.connector.connect(host=globalVar.IP_ADDRESS_DB,
                                        port= globalVar.DB_PORT,
                                        database=globalVar.DB_NAME,
                                        user=globalVar.DB_USER,
                                        password=(globalVar.DB_PASSWORD).encode("utf8"))
cursor = db.cursor()


#SETUP teste la connexion a la BDD
class Db(Resource):
    def post(self):
        conn = None
        try:
            conn = mysql.connector.connect(host=globalVar.IP_ADDRESS_DB,
                                        port= globalVar.DB_PORT,
                                        database=globalVar.DB_NAME,
                                        user=globalVar.DB_USER,
                                        password=(globalVar.DB_PASSWORD).encode("utf8"))
            if conn.is_connected():
                return {"data" : "Connected to MySQL database"}
        except Exception as e:
            return {"code" : 500, "error" : str(e)}
        finally:
            if conn is not None and conn.is_connected():
                conn.close()

#INIT URL d'api et méthode en fonction de la requête reçue
class HelloWorld(Resource):
    def post(self):
        return {"data" : "HelloWorld"}

#INSERT un nouvel utilisateur dans la base de données (UNIQUEMENT LORS DE LA CREATION D'UN COMPTE)
class insertUser(Resource):
    def post(self):
        if request is not None:
            nom_utilisateurs = request.form['nom_utilisateurs']
            #print(request.form['nom_utilisateurs'])
            prenom_utilisateurs = request.form['prenom_utilisateurs']
            mail_utilisateurs = request.form['mail_utilisateurs']
            mdp_utilisateurs = request.form['mdp_utilisateurs']
            telephone_utilisateurs = request.form['telephone_utilisateurs']
            adresse_utilisateurs = request.form['adresse_utilisateurs']
            codepostal_utilisateurs = request.form['codepostal_utilisateurs']
            abonnement_idabonnement = request.form['abonnement_idabonnement']
            #print(request.form['abonnement_idabonnement'])

            dataSet = (nom_utilisateurs,prenom_utilisateurs,mail_utilisateurs,mdp_utilisateurs,telephone_utilisateurs,adresse_utilisateurs,codepostal_utilisateurs,abonnement_idabonnement)
            cursor.execute('''
                            INSERT INTO utilisateur (`idUtilisateur`, `nom_utilisateur`, `prenom_utilisateur`, 
                            `mail_utilisateur`, `mdp_utilisateur`, `telephone_utilisateur`, `adresse_utilisateur`, 
                            `codepostal_utilisateur`, `abonnement_idabonnement`) 
                            VALUES (NULL,'%s','%s','%s','%s','%s','%s','%s','%s')
                            ''' %dataSet)
            db.commit()
            return {"code" : 200, "message" : "insertion effectue"} #200 is OK
        else:
            return {"code" : 400} #400 is PROBLEM WITH REQUEST

#INSERT un nouvel viticulteur dans la base de données (UNIQUEMENT LORS DE LA CREATION D'UN COMPTE)
class insertViticulteur(Resource):
    def post(self):
        if request is not None:
            nom_viticulteur = request.form['nom_viticulteur']
            prenom_viticulteur = request.form['prenom_viticulteur']
            mail_viticulteur = request.form['mail_viticulteur']
            mdp_viticulteur = request.form['mdp_viticulteur']
            adresse_viticulteur = request.form['adresse_viticulteur']
            adresse_viticulteur = request.form['adresse_viticulteur']
            codepostal_viticulteur = request.form['codepostal_viticulteur']
            nom_entreprise_viticulteur = request.form['nom_entreprise_viticulteur']
            img_viticulteur = request.form['img_viticulteur']

            dataSet = (nom_viticulteur,prenom_viticulteur,mail_viticulteur,mdp_viticulteur,adresse_viticulteur,adresse_viticulteur,codepostal_viticulteur,nom_entreprise_viticulteur,img_viticulteur)
            cursor.execute('''                            INSERT INTO viticulteur (`idviticulteur`, `nom_viticulteur`, `prenom_viticulteur`, 
                            `mail_viticulteur`, `mdp_viticulteur`, `telephone_viticulteur`, `adresse_viticulteur`, 
                            `codepostal_viticulteur`, `nom_entreprise_viticulteur`, `img_viticulteur` ) 
                            VALUES (NULL,'%s','%s','%s','%s','%s','%s','%s','%s','%s')
                            ''' %dataSet)
            db.commit()
            return {"code" : 200, "message" : "insertion effectue"} #200 is OK
        else:
            return {"code" : 400} #400 is PROBLEM WITH REQUEST



#UPDATE une information que l'utilisateur souhaite modifier
class updateInfo(Resource):
    def post(self):
        if request is not None :
            db_request = 'UPDATE `'+str.lower(request.form['table'])+'` SET'
            db_data=' '
            for key,val in request.form.items():
                if key == 'table' or key == 'id_user':
                    next(request.form.items())
                else:
                    db_data = db_data+'`'+key+'_'+request.form['table']+'`=\''+val+'\','
            db_data = db_request + db_data[:-1] + ' WHERE `id'+request.form['table']+'` = '+ request.form['id_user']
            try:
                cursor.execute(db_data)
                db.commit()
                return {"code" : 200, "message" : "modification effectue"} #200 is OK
            except:
                return {"code" : 400, "message" : "erreur requête"} #400 is PROBLEM WITH REQUEST
        else:
            return {"code" : 400,"reponse" : "400 : requête vide"} #400 is PROBLEM WITH REQUEST





api.add_resource(HelloWorld, '/helloWorld')
api.add_resource(Db,'/testDb')
api.add_resource(insertUser, '/insertUser') 
api.add_resource(updateInfo,'/updateInfo')
api.add_resource(insertViticulteur,'/insertviticulteur')


if __name__ == '__main__':
    app.run(
        host= os.getenv('IP', globalVar.IP_ADDRESS_API),
        port= int(os.getenv('PORT', globalVar.PORT_ADDRESS_API)),
        debug=True
    )

