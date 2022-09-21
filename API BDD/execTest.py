import requests
import globalVar
import random
import json
# INIT constante global (stocke toute les constantes)
globalVar.initialize()

#SETUP les variable globale de l'API dans une seule
API_IP = "http://" + globalVar.IP_ADDRESS_API + ":" + str(globalVar.PORT_ADDRESS_API)
print(API_IP)

#test préliminaire bon fonctionnement api
response = requests.post(API_IP + "/helloWorld")
print(response.json())


response = requests.post(API_IP + "/testDb")
print(response.json())

form = {
     'nom_utilisateurs': "TUTU",
     'prenom_utilisateurs': "LOCHBULU",
     'mail_utilisateurs': "TUTULOCHBULU@gmail.com",
     'mdp_utilisateurs': "1234567891",
     'telephone_utilisateurs': "0601020304",
     'adresse_utilisateurs': "8 rue TUTULOCHBULU",
     'codepostal_utilisateurs': "74000",
     'abonnement_idabonnement': 2
}
response = requests.post(API_IP + "/insertUser", data = form)
print(response.json())



#test Update info

#utilisateur voulant modifier ses infos perso
A_FORM={
     'table':'Utilisateur',
     'id_user': '5',
     'nom':'UPDATED NAME',
     'prenom':'TOTOLOCHOBOLO',
     'telephone':'0405060809',
     'adresse':'9 Route des Procrastinateurs'
}

B_FORM={
     'table':'Viticulteur',
     'id_user': '5',
     'nom':'UPDATED NAME',
     'prenom':'TOTOLOCHOBOLO',
     'telephone':'0405060809',
     'adresse':'9 Route des Procrastinateurs'
}
C_FORM={
     'table':'Produit',
     'id_user': '3',
     'nom':'Promo Package été',
     'detaile':'REDUCTION CHOC sur le Package été ! Prenez tant que vous le pouvez !',
}
#random.choice([A_USER,B_USER,C_USER])

response = requests.post(API_IP + "/updateInfo", data=C_FORM)
print(response.json())
